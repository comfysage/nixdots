{config, ...}: {
  imports = [
    # ./gpg.nix
    # ./ssh.nix
    ./xdg.nix
    ./themes
  ];

  home.file.".local/share/fonts/scf" = {
    enable = true;
    source = config.lib.file.mkOutOfStoreSymlink "/home/comfy/dev/SCF";
  };
}
