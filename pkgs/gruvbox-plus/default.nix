{pkgs}:
pkgs.stdenv.mkDerivation {
  name = "gruvbox-plus";

  src = let
    version = "3.1";
  in
    pkgs.fetchurl {
      url = "https://github.com/SylEleuth/gruvbox-plus-icon-pack/releases/download/v${version}/gruvbox-plus-icon-pack-${version}.zip";
      sha256 = "0rra07p0iw1k4ncp40ri7khw1xvysm0d4qvfn2bjf07zij2k7w4b";
    };

  dontUnpack = true;

  # nativeBuildInputs = [ gtk3 ];

  # postPatch = "cat > volumeicon/CMakeLists.txt";
  # postFixup = "gtk-update-icon-cache $out/share/icons/gruvbox-plus";

  installPhase = ''
    mkdir -p $out/share/icons/gruvbox-plus
    ${pkgs.unzip}/bin/unzip $src -d $out/share/icons/gruvbox-plus
  '';
}
