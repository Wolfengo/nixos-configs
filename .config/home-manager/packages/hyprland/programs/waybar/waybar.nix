{ pkgs, config, ... }:

{
  programs.waybar = {
    enable = true;

    # Конфиг Waybar
    settings = { };

    # CSS тема
    style = builtins.readFile ./style.css;
  };

  # Ложим остальные файлы (цвета и xml)
  xdg.configFile = {
    "waybar/config".source = ./config.jsonc;
    # "waybar/colors.css".source = ./colors.css;
    # "waybar/logout_menu.xml".source = ./logout_menu.xml;
  };
}
