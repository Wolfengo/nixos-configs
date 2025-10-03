
### Для ноутбуков intel/nvidia
Нужно раскомментировать 
```nix
	hardware.amdgpu.prime = {
	    intelBusId = "PCI:0:2:0";   # Шина Intel GPU (уточняется через lspci)
	    amdBusId = "PCI:1:0:0";		# Шина AMD GPU (также проверяется через lspci)
	    offload.enable = true;      # Включаем возможность запускать программы на AMD
	};
```
Далее, нужно узнать что указать для PCI в intelBusId и nvidiaBusId:
```bash
lspci | grep VGA
```
Вывод будет примерно такой:
```bash
[roman@nixos:~]$ lspci | grep VGA
00:02.0 VGA compatible controller: Intel Corporation TigerLake-H GT1 [UHD Graphics] (rev 01)
01:00.0 VGA compatible controller: AMD Radeon ... (rev a1)
```
