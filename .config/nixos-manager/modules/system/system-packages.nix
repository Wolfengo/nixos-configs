{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # --- Базовый набор для любой системы ---
    vim            # редактор
    wget           # загрузка файлов
    git            # управление репозиториями
    curl           # удобно для сетевых запросов
    htop           # мониторинг процессов
    unzip          # распаковка архивов
    pciutils       # lspci и диагностика железа
    usbutils       # lsusb
	home-manager   # Управление home-manager
  ];
}
