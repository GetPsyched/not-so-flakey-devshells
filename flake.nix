{
  description = "Configure dev shells for any language/framework";

  outputs = { nixpkgs, ... }:
    let
      forAllSystems = function:
        nixpkgs.lib.genAttrs [
          "aarch64-darwin"
          "aarch64-linux"
          "i686-linux"
          "x86_64-darwin"
          "x86_64-linux"
        ]
          (system: function nixpkgs.legacyPackages.${system});
    in
    {
      packages = forAllSystems (pkgs: with pkgs; {
        default = ({ environments ? [ ] }: symlinkJoin {
          name = "default";
          paths = [
            nixpkgs-fmt
          ] ++ builtins.concatMap (env: (import ./devShells/${env}.nix { inherit pkgs; }).default) environments;
        }) { };

        vscode = ({ environments ? [ ] }: callPackage ./packages/vscode.nix {
          extensions = (builtins.concatMap (env: (import ./devShells/${env}.nix { inherit pkgs; }).vscode.extensions) environments);
        }) { };
      });
    };
}
