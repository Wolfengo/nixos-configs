{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # --- Программы ---
    steam
	telegram-desktop
	discord
	bitwarden
	vscodium

	blueman
	kdePackages.dolphin
  ];
}
