# nix-starter-flakes
A compilation of opinionated, minimal flakes that can be extended for customised use.

## Features
As of right now, my flakes provide 2 package outputs: `default` and `vscode`.
1. `default` provides the basic command-line stuff that you would need for the respective language, technology, or whatever the flake is for.
2. `vscode` provides extension overrides so that you can get a fully featured IDE for your development. Note: I plan to add workspace setting overrides as well but I haven't figured that out yet. Stay tuned.

## Installation
Add the following to your flake inputs:
```nix
inputs = {
  # using FlakeHub
  <flake>.url = "https://flakehub.com/f/GetPsyched/<flake>/0.x.x.tar.gz";
  <flake>.inputs.nixpkgs.follows = "nixpkgs";

  # using GitHub
  <flake>.url = "github:GetPsyched/nix-starter-flakes?dir=<flake-dir>";
  <flake>.inputs.nixpkgs.follows = "nixpkgs";
};
```

## Usage
My flakes provide `packages` for most systems which you can using inside your `devShells`. Here's how:
```nix
devShells.${system}.default = pkgs.mkShell {
  buildInputs = with inputs.<flake>.outputs.packages.${system}; [
    default
    vscode
  ];
};
```
