{
  description = "Setting LSP for Nix";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nixpkgs.follows = "nix-vscode-extensions/nixpkgs";
  };

  outputs = inputs@{ nixpkgs, flake-parts, ... }: flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [
      "x86_64-linux"
      "aarch64-linux"
      "i686-linux"
      "x86_64-darwin"
    ];

    perSystem = { pkgs, system, ... }:
      let
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        extensions = inputs.nix-vscode-extensions.extensions.${system};
        inherit (pkgs) vscode-with-extensions vscodium;
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            nixpkgs-fmt
            (vscode-with-extensions.override {
              vscode = vscodium;
              vscodeExtensions = with extensions.vscode-marketplace; [
                jnoortheen.nix-ide
              ];
            })
          ];
        };
      };
  };
}
