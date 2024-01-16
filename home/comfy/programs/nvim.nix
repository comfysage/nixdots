let
  home = import <home-manager-config>;
in
  {pkgs, ...}: {
    home.packages = with pkgs; [
      neovim-nightly

      neovide

      # lsp servers
      rnix-lsp
      lua-language-server
      gopls
    ];
  }
