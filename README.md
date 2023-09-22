# nix-starter-flakes
A compilation of opinionated, minimal flakes that can be extended for customised use.

WARNING: This project is under heavy development. Things could break at any time. Please wait for v1.x.x

## Features
1. Zero dependencies.
2. As of right now, my flakes provide 2 package outputs: `default` and `vscode`.
   - `default` provides the basic command-line stuff that you would need for the respective language, technology, or whatever the flake is for.
   - `vscode` provides extension overrides for `vscode` so that you can get a fully featured IDE for your development.<br>
      Note:
      - This uses the [`VSCodium`](https://github.com/VSCodium/vscodium) package under-the-hood.
      - I plan to add workspace setting overrides as well but I haven't figured that out yet. Stay tuned.

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

## Example
```nix
# flake.nix
{
  description = "...";

  inputs = {
    svelte-env.url = "https://flakehub.com/f/GetPsyched/svelte-env/0.x.x.tar.gz";
    svelte-env.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, svelte-env, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      svelte-env-pkgs = svelte-env.outputs.packages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          # Your regular imports:
          pkgs.some-package-from-nixpkgs

          # Packages from my flake:
          svelte-env-pkgs.default
          svelte-env-pkgs.vscode
        ];
      };
    };
}
```
