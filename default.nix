{ lib, stdenvNoCC }:

stdenvNoCC.mkDerivation rec {
  name = "anne-pro-udev-rules";

  udevRules = ./anne-pro.rules;
  dontUnpack = true;

  installPhase = ''
    install -Dm 644 "${udevRules}" "$out/lib/udev/rules.d/51-annepro.rules"
  '';

  meta = with lib; {
    description = "udev rules that give NixOS permission to communicate with Anne Pro keyboards";
    longDescription = ''
      udev rules that give NixOS permission to communicate with Anne Pro keyboards.
      To use it under NixOS, add

        services.udev.packages = [ pkgs.anne-pro-udev-rules ];

      to the system configuration.
    '';
    license = licenses.free;
    maintainers = with maintainers; [ ch3rrix ];
    platforms = platforms.linux;
  };
}

