{ pkgs }:
{
  default = with pkgs; [ rustup ];
  vscodium = {
    extensions = with pkgs.vscode-extensions; [
      bungcip.better-toml
      matklad.rust-analyzer
    ];
  };
}
