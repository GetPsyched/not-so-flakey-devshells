{ pkgs }:
{
  cpp-default = with pkgs; symlinkJoin {
    name = "default";
    paths = [
      clang-tools
      gcc
      nixpkgs-fmt
    ];
  };
  cpp-vscode = (pkgs.callPackage ../packages/vscode.nix {
    extensions = with pkgs.vscode-extensions; [
      llvm-vs-code-extensions.vscode-clangd
    ];
  });
}
