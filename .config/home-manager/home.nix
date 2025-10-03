
{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./shell-aliases.nix

    ./packages/base.nix
    ./packages/dev.nix
    ./packages/hyprland/hypr.nix
    ./packages/apps.nix
  ];

  home = {
    username = "roman";
    homeDirectory = "/home/roman";
    stateVersion = "25.05";
  };
}
