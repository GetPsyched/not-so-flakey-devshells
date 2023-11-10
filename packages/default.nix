{ environments, pkgs, ... }:

with pkgs; symlinkJoin {
  name = "default";
  paths = builtins.concatMap (env: (import ../devShells/${env}.nix { inherit pkgs; }).default) environments;
}
