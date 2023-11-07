{ pkgs }:
{
  default = with pkgs; [ bun ];
  vscode = {
    extensions = with pkgs.vscode-extensions; [
      esbenp.prettier-vscode
      svelte.svelte-vscode
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "bun-vscode";
        publisher = "oven";
        version = "0.0.8";
        sha256 = "sha256-GJTCn6s9nN3kgbyJ4f1eFm7/fQezW2OmzcbSuYskDnk=";
      }
    ];
  };
}
