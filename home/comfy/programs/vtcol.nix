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
    home.file.".vtcol/${config.colorScheme.name}" = let
      colors = config.colorScheme.colors;
    in {
      enable = true;
      text = ''
        0#${colors.base00}   base03
        8#${colors.base08}   base03
        1#${colors.base01}   base03
        9#${colors.base09}   base03
        2#${colors.base02}   base03
        10#${colors.base0A}  base03
        3#${colors.base03}   base03
        11#${colors.base0B}  base03
        4#${colors.base04}   base03
        12#${colors.base0C}  base03
        5#${colors.base05}   base03
        13#${colors.base0D}  base03
        6#${colors.base06}   base03
        14#${colors.base0E}  base03
        7#${colors.base07}   base03
        15#${colors.base0F}  base03
      '';
    };
    home.file.".vtcol/theme" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.vtcol/${config.colorScheme.name}";
    };
  }
