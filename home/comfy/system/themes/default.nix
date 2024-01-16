{pkgs, ...}: {
  imports = [
    ./gtk.nix
    ./qt.nix
  ];

  home = {
    pointerCursor = {
      package = pkgs.capitaine-cursors;
      name = "capitaine-cursors";
      size = 16;
      gtk.enable = true;
      x11.enable = true;
    };
  };
}
