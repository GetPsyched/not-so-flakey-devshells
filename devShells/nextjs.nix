{ pkgs }:
{
  default = with pkgs; [ nixpkgs-fmt nodejs ];
  vscode = {
    extensions = with pkgs.vscode-extensions; [
      bradlc.vscode-tailwindcss
      esbenp.prettier-vscode
    ];
  };
}
