{ pkgs }:
{
  default = with pkgs; [ go gopls ];
  vscode = {
    extensions = with pkgs.vscode-extensions; [
      golang.go
    ];
  };
}
