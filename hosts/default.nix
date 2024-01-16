{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    #config = {
    #  # Disable if you don't want unfree packages
    #  allowUnfree = true;
    #};
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: {flake = value;}) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };
  };

  # networking.hostName = "cottage";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Paris";

  environment.systemPackages = with pkgs; [
    terminus_font
    htop
  ];

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    #font = "sun12x22";
    packages = with pkgs; [terminus_font];
    font = "${pkgs.terminus_font}/share/consolefonts/ter-i22b.psf.gz";
    # keyMap = "us";
    useXkbConfig = true;
  };

  sound.enable = true;
  #hardware.pulseaudio.enable = true;
  services.xserver.libinput.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  programs.zsh.enable = true;
  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;

  nixpkgs = {
    #overlays = [ (import ./overlays.nix) ];
    config.allowUnfree = true;
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.sshd.enable = true;

  networking.firewall.enable = false;
}
