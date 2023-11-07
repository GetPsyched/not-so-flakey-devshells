{ pkgs }:
{
  default = with pkgs; [ go gopls ];
  vscodium = {
    extensions = with pkgs.vscode-extensions; [
      golang.go
    ];
  };
}
