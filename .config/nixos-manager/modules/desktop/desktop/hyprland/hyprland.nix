{ config, pkgs, ... }:

{
  ########################
  # Hyprland
  ########################
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  ########################
  # Wayland essentials
  ########################
  environment.systemPackages = with pkgs; [
    wayland
    wayland-utils

    # XWayland
    xwayland

    # Clipboard
    wl-clipboard
    cliphist

    # Screenshots
    grim
    slurp

    # Cursor / utils
    seatd
    libinput

    # Notifications
    mako

    # App launcher
    rofi-wayland

    # Status bar
    waybar

    # Portals
    xdg-desktop-portal
    xdg-desktop-portal-hyprland

    # Polkit agent
    polkit_gnome

    # Brightness & audio
    brightnessctl
    pamixer
  ];

  ########################
  # Services
  ########################
  services.dbus.enable = true;

  services.seatd.enable = true;

  ########################
  # XDG Portals (КРИТИЧНО)
  ########################
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  ########################
  # Security / Polkit
  ########################
  security.polkit.enable = true;
}
