{ pkgs }:
{
  default = with pkgs; [ go gopls nixpkgs-fmt ];
  vscode = {
    extensions = with pkgs.vscode-extensions; [
      golang.go
    ];
  };
}
