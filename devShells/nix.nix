{ pkgs }:
{
  default = with pkgs; [ nixpkgs-fmt ];
  vscode = {
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
    ];
  };
}
