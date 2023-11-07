{ pkgs }:
{
  rust-default = with pkgs; symlinkJoin {
    name = "default";
    paths = [ nixpkgs-fmt rustup ];
  };
  rust-vscode = (pkgs.callPackage ../packages/vscode.nix {
    extensions = with pkgs.vscode-extensions; [
      bungcip.better-toml
      matklad.rust-analyzer
    ];
  });
}
