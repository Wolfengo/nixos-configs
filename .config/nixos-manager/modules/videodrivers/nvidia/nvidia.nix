{ config, pkgs, ... }:
{
	services.xserver.videoDrivers = [ "nvidia" ];

	environment.variables = {
		GBM_BACKEND = "nvidia-drm";
		LIBVA_DRIVER_NAME = "nvidia";
		__GLX_VENDOR_LIBRARY_NAME = "nvidia";
	};

	hardware.nvidia = {
		modesetting.enable = true;
		open = false;
		nvidiaSettings = true;
		powerManagement.enable = true;
		package = config.boot.kernelPackages.nvidiaPackages.latest;

		# prime = {
		# 	intelBusId = "PCI:0:2:0";
		# 	nvidiaBusId = "PCI:1:0:0";
		# 	offload.enable = true;
		# };
	};

	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};

	environment.systemPackages = with pkgs; [
		nvidia-vaapi-driver
		vaapiVdpau
		libvdpau-va-gl
	];
}
