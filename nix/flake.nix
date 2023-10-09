{
  description = "Nix environment";

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
        default = pkgs.nixpkgs-fmt;
        vscode = (extensions: with pkgs; symlinkJoin {
          name = "vscode";
          paths = [
            (vscode-with-extensions.override {
              vscode = vscodium;
              vscodeExtensions = with vscode-extensions; [
                jnoortheen.nix-ide
              ] ++ extensions;
            })
          ];
        });
      });
    };
}
