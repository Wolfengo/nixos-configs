{ ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      # Основные команды
      rebuild = "sudo nixos-rebuild switch";
      hrebuild = "home-manager switch";

      # Просмотр поколений
      nix-list = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
      home-list = "nix-env --list-generations -p ~/.local/state/nix/profiles/home-manager";

      # Откат
      rollback = "sudo nixos-rebuild switch --rollback";
      hm-rollback = "home-manager switch --rollback";

      # Поиск пакетов
      nix-search = "nix search nixpkgs#";

      # Очистка
      nix-clean = "sudo nix-collect-garbage -d";
      home-clean = "nix-collect-garbage -d";

      # Информация
      nix-info = "nix-shell -p nix-info --run 'nix-info -m'";
    };
  };
}
