{ pkgs }:
{
  default = with pkgs; [ python311 ];
  vscode = {
    extensions = with pkgs.vscode-extensions; [
      ms-pyright.pyright
      (pkgs.callPackage ../packages/ms-python.python.nix { })
    ];
  };
}
