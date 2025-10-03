{ pkgs, ... }:

{
	home.packages = with pkgs; [
		# --- Hyprland окружение ---
		# waybar # настроен в ./programs/waybar
		# rofi # настроен в ./programs/rofi
		hyprpaper
		kitty
		swaylock
		swayidle
		wl-clipboard
		mpd mpc ncmpcpp    # музыка
		pavucontrol        # громкость
		power-profiles-daemon
		python3            # для скриптов (custom/media)

		# --- Уведомления ---
		mako
		libnotify

		# --- Мультимедиа ---
		playerctl
	];
	
	imports = [
		./programs/waybar/waybar.nix
		./programs/rofi.nix
	];
}
