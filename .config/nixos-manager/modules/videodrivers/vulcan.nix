{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		vulkan-loader 
		# vulkan-validation-layers 
		vulkan-tools
	];
}
