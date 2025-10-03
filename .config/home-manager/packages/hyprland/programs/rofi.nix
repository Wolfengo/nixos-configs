{ pkgs, ... }:

{
	programs.rofi = {
		enable = true;
		package = pkgs.rofi-wayland; # Wayland-версия Rofi

		font = "FiraCode Nerd Font 12";

		# Указываем тему
		theme = "fullscreen-preview";

		# Свой конфиг (переписывает rofi config.rasi)
		extraConfig = {
			modi = "drun,run,window";  # какие режимы доступны
			show-icons = true;         # иконки в мен
			sidebar-mode = false;
		};
	};
}
