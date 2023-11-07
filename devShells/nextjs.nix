{ pkgs }:
{
  nextjs-default = with pkgs; symlinkJoin {
    name = "default";
    paths = [ nixpkgs-fmt nodejs ];
  };
  nextjs-vscode = (pkgs.callPackage ../packages/vscode.nix {
    extensions = with pkgs.vscode-extensions; [
      bradlc.vscode-tailwindcss
      esbenp.prettier-vscode
    ];
  });
}
