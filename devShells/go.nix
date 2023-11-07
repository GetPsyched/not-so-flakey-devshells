{ pkgs }:
{
  go-default = with pkgs; symlinkJoin {
    name = "default";
    paths = [ go gopls nixpkgs-fmt ];
  };
  go-vscode = (pkgs.callPackage ../packages/vscode.nix {
    extensions = with pkgs.vscode-extensions; [
      golang.go
    ];
  });
}
