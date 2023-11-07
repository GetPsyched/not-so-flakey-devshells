{
  description = "Configure dev shells for any language/framework";

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

      mkEnv = env: pkgs: import ./devShells/${env}.nix { inherit pkgs; };
    in
    {
      packages = forAllSystems (pkgs: {
        default = pkgs.nixpkgs-fmt;
        vscode = (pkgs.callPackage ./packages/vscode.nix { });
      }
      // (mkEnv "cpp" pkgs)
      // (mkEnv "go" pkgs)
      // (mkEnv "nextjs" pkgs)
      // (mkEnv "python" pkgs)
      // (mkEnv "rust" pkgs)
      // (mkEnv "svelte" pkgs)
      );
    };
}
