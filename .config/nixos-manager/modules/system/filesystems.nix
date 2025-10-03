{ config, pkgs, ... }:
{
	fileSystems."/home/share" = {
		device = "UUID=6ed533fa-ab61-43bd-af88-2aa950700613";
		fsType = "ext4";
		options = ["defaults" "nofail"];
	};
}
