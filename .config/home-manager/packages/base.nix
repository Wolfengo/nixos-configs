{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # --- Основные утилиты ---
    neofetch
    htop
    btop # для мониторинга CPU/Memory через kitty
    neovim
    networkmanagerapplet
    pavucontrol
  ];
}
