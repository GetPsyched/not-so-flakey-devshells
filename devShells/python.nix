{ pkgs }:
{
  default = with pkgs; [ python311 nixpkgs-fmt ];
  vscode = {
    extensions = with pkgs.vscode-extensions; [
      ms-pyright.pyright
      (pkgs.callPackage ../packages/ms-python.python.nix { })
    ];
  };
}
