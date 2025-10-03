{ config, pkgs, ... }:
{
	services.pipewire = {
		enable = true;
		pulse.enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		wireplumber.enable = true;
	};

	environment.systemPackages = with pkgs; [
		pipewire
		wireplumber
		pavucontrol
		qpwgraph
	];
}
