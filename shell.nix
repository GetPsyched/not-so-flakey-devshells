{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs.buildPackages; [
    just
    nixpkgs-fmt
    (callPackage ./packages/vscodium.nix {
      extensions = vscode-utils.extensionsFromVscodeMarketplace [{
        name = "vscode-yaml";
        publisher = "redhat";
        version = "1.14.0";
        sha256 = "sha256-hCRyDA6oZF7hJv0YmbNG3S2XPtNbyxX1j3qL1ixOnF8=";
      }];
    })
  ];
}
