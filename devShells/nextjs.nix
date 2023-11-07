{ pkgs }:
{
  default = with pkgs; [ nodejs ];
  vscode = {
    extensions = with pkgs.vscode-extensions; [
      bradlc.vscode-tailwindcss
      esbenp.prettier-vscode
    ];
  };
}
