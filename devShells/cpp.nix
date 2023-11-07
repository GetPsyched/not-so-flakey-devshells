{ pkgs }:
{
  default = with pkgs; [ clang-tools gcc ];
  vscodium = {
    extensions = with pkgs.vscode-extensions; [
      llvm-vs-code-extensions.vscode-clangd
    ];
  };
}
