{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # полезно для диагностики
  boot.kernelParams = [
    "quiet"
    "splash"
  ];
}
