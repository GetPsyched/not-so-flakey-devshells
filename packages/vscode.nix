{ extensions ? [ ], pkgs, ... }:

with pkgs; symlinkJoin {
  name = "vscode";
  paths = [
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = extensions;
    })

    # Fix for: https://discourse.nixos.org/t/interactive-bash-with-nix-develop-flake/15486
    bashInteractive
  ];
}
