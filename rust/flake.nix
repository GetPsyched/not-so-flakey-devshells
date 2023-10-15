{
  description = "Rust environment";

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
          paths = [ nixpkgs-fmt rustup ];
        };
        vscode = (pkgs.callPackage ../vscode.nix {
          extensions = with pkgs.vscode-extensions; [
            bungcip.better-toml
            matklad.rust-analyzer
          ];
        });
      });
    };
}
