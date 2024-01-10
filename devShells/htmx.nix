{ pkgs }:
{
  default = with pkgs; [ htmx-lsp ];
  vscodium = {
    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
      name = "htmx-tags";
      publisher = "otovo-oss";
      version = "0.0.8";
      sha256 = "sha256-sF5VpdmPluygAiGt9a9E/bM/VzA6a++0dR87dweMCyQ=";
    }];
  };
}
