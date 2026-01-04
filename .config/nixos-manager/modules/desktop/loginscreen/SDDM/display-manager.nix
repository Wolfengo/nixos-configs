{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # Для Wayland-сессий
  services.displayManager.defaultSession = "hyprland";
}
