{pkgs}: let
  imgLink = "https://github.com/crispybaccoon/wallpapers/raw/mega/wall/scape.jpg";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "0a5y8h7pjmczf5m7krs3jl4fjmiz7aixf44wmrc4k683239is13h";
  };
in
  pkgs.stdenv.mkDerivation {
    name = "sddm-sugar-dark";
    src = pkgs.fetchFromGitHub {
      owner = "MarianArlt";
      repo = "sddm-sugar-dark";
      rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
      sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
    };
    installPhase = ''
      mkdir -p $out
      cp -R ./* $out/
      cd $out/
      rm Background.jpg
      cp -r ${image} $out/Background.jpg
    '';
  }
