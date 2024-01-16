let
  home = import <home-manager-config>;
in
  {pkgs, ...}: {
    home.packages = with pkgs; [
      rustup
    ];
  }
