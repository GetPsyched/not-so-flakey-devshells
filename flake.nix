{
  description = "Configure dev shells for any language/framework";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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
      packages = forAllSystems (pkgs: with pkgs; {
        default = ({ environments ? [ "nix" ] }: symlinkJoin {
          name = "default";
          paths = builtins.concatMap (env: (import ./devShells/${env}.nix { inherit pkgs; }).default) environments;
        }) { };

        vscodium = ({ environments ? [ "nix" ] }: callPackage ./packages/vscodium.nix {
          envExtensions = (builtins.concatMap (env: (import ./devShells/${env}.nix { inherit pkgs; }).vscodium.extensions) environments);
        }) { };
      });
    };
}
