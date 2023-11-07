{ pkgs }:
{
  default = with pkgs; [ nodejs ];
  vscodium = {
    extensions = with pkgs.vscode-extensions; [
      bradlc.vscode-tailwindcss
      esbenp.prettier-vscode
    ];
  };
}
