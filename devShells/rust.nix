{ pkgs }:
{
  default = with pkgs; [ rustup ];
  vscodium = {
    extensions = with pkgs.vscode-extensions; [
      bungcip.better-toml
      rust-lang.rust-analyzer
    ];
  };
}
