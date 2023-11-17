{ pkgs }:
{
  default = with pkgs; [ python311 ];
  vscodium = {
    extensions = with pkgs.vscode-extensions; [
      ms-pyright.pyright
      ms-python.black-formatter
      (pkgs.callPackage ../packages/ms-python.python.nix { })
    ];
  };
}
