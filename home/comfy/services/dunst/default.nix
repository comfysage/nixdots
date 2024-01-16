let
  home = import <home-manager-config>;
in
  {
    pkgs,
    inputs,
    lib,
    config,
    ...
  }: {
    home.file.".config/dunst/dunstrc" = let
      colors = config.colorScheme.colors;
    in {
      enable = true;
      text =
        (builtins.readFile ./dunst.cfg)
        + ''
          [global]
          frame_color = "#${colors.base06}"
          [urgency_low]
          background = "#${colors.base00}"
          foreground = "#${colors.base0F}"
          frame_color = "#${colors.base0F}"

          [urgency_normal]
          background = "#${colors.base00}"
          foreground = "#${colors.base07}"
          frame_color = "#${colors.base06}"

          [urgency_critical]
          background = "#${colors.base00}"
          foreground = "#${colors.base07}"
          frame_color = "#${colors.base01}"
        '';
    };
  }
