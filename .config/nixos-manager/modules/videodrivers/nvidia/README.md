### Для ноутбуков intel/nvidia
Нужно раскомментировать 
```nix
		prime = {
		 	intelBusId = "PCI:0:2:0";
		 	nvidiaBusId = "PCI:1:0:0";
		 	offload.enable = true;
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
01:00.0 VGA compatible controller: NVIDIA Corporation GA107M [GeForce RTX 3050 Mobile] (rev a1)
```
