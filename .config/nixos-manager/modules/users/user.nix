{ config, pkgs, ... }:
{
  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "networkmanager" "video" "audio" ];
  };
}
