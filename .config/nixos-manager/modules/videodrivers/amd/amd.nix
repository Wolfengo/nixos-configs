{ config, pkgs, ... }:

{
	# Указываем драйверы X11
	services.xserver.videoDrivers = [ "amdgpu" "radeon" ];

	hardware.amdgpu.enable = true;

	hardware.graphics = {
		enable = true;       # Включаем поддержку OpenGL/Mesa
		enable32Bit = true;  # Для 32-битных игр и приложений (например, Steam)
	};

	# Для ноутбуков с Intel + AMD (PRIME Render Offload)
	# Настройка PRIME Render Offload (переключение между Intel и AMD)
	# Работает по аналогии с NVIDIA, но проще.
	# Обычно Intel используется для энергосбережения, а AMD – для игр/графики.
	
	# Должно работать из коробки, но есть будут проблемы, то можно попробовать включить PRIME
	#hardware.amdgpu.prime = {
	#  intelBusId = "PCI:0:2:0";   # Шина Intel GPU (уточняется через lspci)
	#  amdBusId = "PCI:1:0:0";		# Шина AMD GPU (также проверяется через lspci)
	#  offload.enable = true;      # Включаем возможность запускать программы на AMD
	#};

	environment.systemPackages = with pkgs; [
		libva                  # Общая библиотека VA-API
		libva-utils            # Тестовые утилиты (vainfo)
		mesa                   # OpenGL/Vulkan драйверы для AMD/Intel
		mesa_drivers           # Основные драйверы Mesa
		vaapiVdpau             # VA-API → VDPAU мост для видео
		libvdpau-va-gl         # OpenGL → VDPAU/VA-API совместимость
	];
}
