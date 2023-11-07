{ pkgs }:
{
  default = with pkgs; [ rustup ];
  vscode = {
    extensions = with pkgs.vscode-extensions; [
      bungcip.better-toml
      matklad.rust-analyzer
    ];
  };
}
