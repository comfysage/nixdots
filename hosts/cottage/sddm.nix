{pkgs, ...}: {
  services.xserver.enable = true;
  services.xserver.displayManager = {
    sddm.enable = true;
    sddm.theme = "${import ../../pkgs/sddm-sugar-dark/default.nix {inherit pkgs;}}";
  };
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];
}
