{ config, pkgs, ... }:

{
    # Разрешить установку проприетарного ПО (NVIDIA, Steam, Spotify и т.д.)
    # Allow installation of proprietary software (NVIDIA, Steam, Spotify, etc.)
    nixpkgs.config.allowUnfree = true;

    # Импорт модулей системы (как Lego-детали, из которых собирается ОС)
    # Import system modules (like Lego pieces that build the OS)
    imports = [
        # Автоматически сгенерированный конфиг оборудования (диски, партиции)
        # Auto-generated hardware config (disks, partitions)
        ./hardware-configuration.nix

        # --- Main modules/Основные модули ---

        # --- Bluetooth ---
        ./modules/bluetooth/bluetooth.nix
        
        # --- System language/Язык системы ---
        ./modules/locale/locale.nix

        # --- Videodrivers/Видеодрайвера ---
        # Для ноутбуков Intel/Nvidia, то зайдите в README .config/nixos-manager/videodrivers/nvidia для инструкции по настройке prime 
        #./modules/videodrivers/nvidia/nvidia.nix #  NVIDIA latest/NVIDIA последние
		
        # Для Ноутбуков Intel/Nvidia должно работать из коробки, но в случае проблем обратиться к README
        # ./modules/videodrivers/amd/amd.nix
        
        # Поддержка Vulkan API для игр и 3D-графики
        # Vulkan API support for games and 3D graphics
        ./modules/videodrivers/vulcan.nix

        # --- Sound/Звук ---
        # Современный звуковой сервер (замена PulseAudio)
        # Modern sound server (replacement for PulseAudio)
        ./modules/sound/pipewire.nix

        # --- Users(add)/Добавление пользователя ---
        # Настройки пользователей и паролей
        # User accounts and password settings
        ./modules/users/user.nix

        # --- GUI/Графические оболочки ---
        
        # --- LoginScreen/Логинскрин ---
        # SDDM - дисплей менеджер (экран входа в систему)
        # SDDM - display manager (login screen)
        ./modules/desktop/loginscreen/SDDM/display-manager.nix
        
        # --- Desktop/Рабочий стол ---
        # Hyprland - современный Wayland композитор (тайлингный вм-менеджер)
        # Hyprland - modern Wayland compositor (tiling window manager)
        ./modules/desktop/desktop/hyprland/hyprland.nix
        
        # --- Fonts/Шрифты ---
        # Установка системных шрифтов (раскомментировать при необходимости)
        # System fonts installation (uncomment if needed)
        #./modules/desktop/fonts.nix

        # --- Systems/Системные ---
        # Сетевые настройки (WiFi, сетевые интерфейсы)
        # Network settings (WiFi, network interfaces)
        ./modules/system/networking.nix
        
        # Настройки загрузчика (GRUB/systemd-boot)
        # Bootloader settings (GRUB/systemd-boot)
        ./modules/system/boot.nix
        
        # Настройки файловых систем (монтирование дисков)
        # Filesystem settings (disk mounting) - ЗАКОММЕНТИРОВАН
        #./modules/system/filesystems.nix
        
        # Установка системных пакетов (vim, git, утилиты)
        # System packages installation (vim, git, utilities)
        ./modules/system/system-packages.nix
        
        # SSH сервер (раскомментировать для удалённого доступа)
        # SSH server (uncomment for remote access)
        #./modules.system/SSH.nix
    ];

    # Версия конфигурации NixOS (НЕ МЕНЯТЬ при обновлении!)
    # NixOS configuration version (DO NOT CHANGE when upgrading!)
    system.stateVersion = "25.05";
}
