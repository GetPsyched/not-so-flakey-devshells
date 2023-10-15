{
  description = "Svelte environment";

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
      packages = forAllSystems (pkgs: {
        default = with pkgs; symlinkJoin {
          name = "default";
          paths = [ bun nixpkgs-fmt ];
        };
        vscode = (pkgs.callPackage ../vscode.nix {
          extensions = with pkgs.vscode-extensions; [
            esbenp.prettier-vscode
            svelte.svelte-vscode
          ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
              name = "bun-vscode";
              publisher = "oven";
              version = "0.0.8";
              sha256 = "sha256-GJTCn6s9nN3kgbyJ4f1eFm7/fQezW2OmzcbSuYskDnk=";
            }
          ];
        });
      });
    };
}
