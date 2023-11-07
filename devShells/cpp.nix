{ pkgs }:
{
  default = with pkgs; [ clang-tools gcc ];
  vscode = {
    extensions = with pkgs.vscode-extensions; [
      llvm-vs-code-extensions.vscode-clangd
    ];
  };
}
