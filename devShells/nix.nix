{ pkgs }:
{
  default = with pkgs; [ nixpkgs-fmt ];
  vscodium = {
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
    ];
  };
}
