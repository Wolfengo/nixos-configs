{ config, pkgs, ... }:

{
  ########################
  # Kernel & firmware
  ########################
  hardware.enableRedistributableFirmware = true;

  boot.kernelModules = [ "amdgpu" ];

  ########################
  # OpenGL / Vulkan
  ########################
  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Steam / Proton
    extraPackages = with pkgs; [
      amdvlk
      rocmPackages.clr.icd
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };

  ########################
  # Mesa (актуально для RDNA3)
  ########################
  environment.systemPackages = with pkgs; [
    mesa
    mesa-demos
    vulkan-tools
    vulkan-validation-layers
    vulkan-loader
    radeontop
    libva
    libva-utils
  ];

  ########################
  # Environment (важно!)
  ########################
  environment.variables = {
    AMD_VULKAN_ICD = "RADV";
    RADV_PERFTEST = "aco";
    MESA_GL_VERSION_OVERRIDE = "4.6";
  };
}
