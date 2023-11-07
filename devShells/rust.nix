{ pkgs }:
{
  default = with pkgs; [ nixpkgs-fmt rustup ];
  vscode = {
    extensions = with pkgs.vscode-extensions; [
      bungcip.better-toml
      matklad.rust-analyzer
    ];
  };
}
