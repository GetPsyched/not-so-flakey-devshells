{ pkgs }:
{
  python-default = with pkgs; symlinkJoin {
    name = "default";
    paths = [ python311 nixpkgs-fmt ];
  };
  python-vscode = (pkgs.callPackage ../packages/vscode.nix {
    extensions = with pkgs.vscode-extensions; [
      ms-pyright.pyright
      (pkgs.callPackage ../packages/ms-python.python.nix { })
    ];
  });
}
