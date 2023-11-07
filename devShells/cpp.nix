{ pkgs }:
{
  default = with pkgs; [ clang-tools gcc nixpkgs-fmt ];
  vscode = {
    extensions = with pkgs.vscode-extensions; [
      llvm-vs-code-extensions.vscode-clangd
    ];
  };
}
