{
  description = "Svelte environment";

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
          paths = [ bun nixpkgs-fmt ];
        };
        vscode = (pkgs.vscode-with-extensions.override {
          vscode = pkgs.vscodium;
          vscodeExtensions = with pkgs.vscode-extensions; [
            jnoortheen.nix-ide
            # oven.bun-vscode
            #   not yet in nixpkgs; don't want to use nix-vscode-extensions
            #   because it adds a lot of complexity and bombards flake.lock
            svelte.svelte-vscode
          ];
        });
      });
    };
}
