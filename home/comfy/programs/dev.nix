let
  home = import <home-manager-config>;
in
  {pkgs, ...}: {
    home.packages = with pkgs; [
      deno
      nodejs_20
      yarn

      python3
      gem
      ruby

      tmux
      lazygit

      glow

      jq
      tldr

      git-cliff
      alejandra

      pandoc
    ];
  }
