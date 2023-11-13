{ environments ? [ "nix" ], extensions ? [ ], pkgs, ... }:

with pkgs; symlinkJoin {
  name = "vscodium";
  paths = [
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = (builtins.concatMap (env: (import ../devShells/${env}.nix { inherit pkgs; }).vscodium.extensions) environments) ++ extensions;
    })

    # Fix for: https://discourse.nixos.org/t/interactive-bash-with-nix-develop-flake/15486
    bashInteractive
  ];
}
