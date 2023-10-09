{
  description = "Environment for this project";

  inputs = {
    nix-env.url = "https://flakehub.com/f/GetPsyched/nix-env/0.x.x.tar.gz";
    nix-env.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, nix-env, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      nix-env-pkgs = nix-env.outputs.packages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with nix-env-pkgs; [
          default
          vscode
          pkgs.just
        ];
      };
    };
}
