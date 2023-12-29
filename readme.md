# not-so-flakey-devshells

[![FlakeHub](https://img.shields.io/endpoint?url=https://flakehub.com/f/GetPsyched/not-so-flakey-devshells/badge)](https://flakehub.com/flake/GetPsyched/not-so-flakey-devshells)

A compilation of opinionated, minimal dev packages that can be extended for customised use.

> **Warning**
> This project is under heavy development. Things could break at any time. Please wait for v1.x.x

## Features
1. Zero dependencies.
2. As of right now, my flake provide 2 package outputs: `default` and `vscodium`.
   - `default` provides the basic command-line stuff that you would need for the respective language, technology, or whatever the flake is for.
   - `vscodium` provides extension overrides for [VSCodium](https://github.com/VSCodium/vscodium) so that you can get a fully featured IDE for your development.<br>
      Note:
      - You can override this package to append additional extensions, if you wish. See [the example below](#example).
      - I plan to add workspace setting overrides as well but I haven't figured that out yet. Stay tuned.

## Installation
Add the following to your flake inputs:
```nix
inputs = {
  # using FlakeHub
  flakey-devShells.url = "https://flakehub.com/f/GetPsyched/not-so-flakey-devshells/0.x.x.tar.gz";
  flakey-devShells.inputs.nixpkgs.follows = "nixpkgs";

  # using GitHub
  flakey-devShells.url = "github:GetPsyched/not-so-flakey-devshells";
  flakey-devShells.inputs.nixpkgs.follows = "nixpkgs";
};
```

## Example
My flakes provide `packages` for most systems which you can use inside your `devShells`. Here's how:
```nix
# flake.nix
{
  description = "...";

  inputs = {
    flakey-devShells.url = "https://flakehub.com/f/GetPsyched/not-so-flakey-devshells/0.x.x.tar.gz";
    flakey-devShells.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, flakey-devShells, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      flakey-devShell-pkgs = flakey-devShells.outputs.packages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          # Your regular imports:
          pkgs.some-package-from-nixpkgs

          # Packages from my flake:
          (flakey-devShell-pkgs.default.override { environments = [ "nix" "svelte" ]; })
          (flakey-devShell-pkgs.vscodium.override {
            # This will install an opinionated list of extensions.
            environments = [ "nix" "svelte" ];

            # If you don't want those or want to add a missing one for your workflow, do it here
            extensions = with pkgs.vscode-extensions; [
              some-publisher.some-extension
            ];
          })
        ];
      };
    };
}
```
