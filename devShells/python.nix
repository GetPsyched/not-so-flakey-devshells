{ pkgs }:
{
  default = with pkgs; [ python311 ];
  vscodium = {
    extensions = with pkgs.vscode-extensions; [
      ms-pyright.pyright
      (pkgs.callPackage ../packages/ms-python.python.nix { })
    ];
  };
}
