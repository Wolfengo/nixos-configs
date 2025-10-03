# ❄️ NixOS 25.05 Manager Configs

Готовый репозиторий конфигураций для **NixOS** с разделением модулей и пошаговой инструкцией с объяснениями всего, чуть ли не до строчки + `home-manager`.  
Подходит для быстрой настройки новой системы и дальнейшего удобного управления.

A ready-to-use repository of **NixOS** configurations with modular structure and step-by-step explanations (almost line-by-line) + `home-manager`.  
Perfect for quickly setting up a fresh system and for convenient long-term management.


<details>
  <summary>Русский</summary>

---

## 📦 Установка

### 1. Устанавливаем систему
Загружаем NixOS на флешку с [официального сайта](https://nixos.org/download/).

Установите чистый NixOS (см. [официальную документацию](https://nixos.org/manual/nixos/stable/)).

Либо какой-нибудь гайд на YouTobe (что проще)

---

### 2. Клонируем репозиторий
```bash
git clone --depth 1 https://github.com/Wolfengo/nixos-configs
```

### 3. (Опционально) Меняем имя пользователя
По умолчанию в конфигах используется user.
1. Открываем папку:
```bash
cd /nixos-configs/.config/nixos-manager/users
```
2. Замените 'user' на ваше имя пользователя
```bash
sed -i 's/users.users.user/users.users.ВАШ_ПОЛЬЗОВАТЕЛЬ/g' user.nix
```
```bash
mv user.nix ВАШ_ПОЛЬЗОВАТЕЛЬ.nix
```

### 4. Первая сборка системы
1. Билдим
```nix
nixos-rebuild switch -I nixos-config=/root/nixos-configs/.config/nixos-manager/configuration.nix
```
2. Перезапускаемся
```bash
reboot
```
## 🔧 После первого входа
### 1. Настройка пользовательской среды
1. После перезапуска заходим в созданного пользователя.
2. Переносим конфиги в домашнюю директорию
```bash
sudo mv -r /nixos-configs/.config ~/.config
```
3. Удаляем ненужную пустую папку
```bash
sudo rm -f /root/nixos-configs
```
### 2. Создаём символьную ссылку:
Она нужна для того, чтобы работать с конфигами nixos без sudo из домашней директории
1. Делаем бекап стандартной конфигурации
```bash
sudo mv /etc/nixos /etc/nixos.backup
```
2. Делаем ссылку
```bash
sudo ln -s ~/.config/nixos-manager /etc/nixos
```
3. Переносим hardware-configuration.nix или создаём новый 

* Этот файл создается автоматически во время установки NixOS с помощью команды nixos-generate-config, которая находится в установщике NixOS. Он анализирует ваше оборудование и автоматически генерирует необходимую конфигурацию для него
```bash
cp /etc/nixos.backup/hardware-configuration.nix /etc/nixos/hardware-configuration.nix 
```
Или
```bash
nixos-generate-config
```
### 3. Сборка пользовательской конфигурации
```bash
home-manager switch
```
Перезапускаемся
```bash
reboot
```

## ⚙️ Донастройка системы
#### После перезагрузки переходим в README nixos-manager
 Отредактируйте конфиги в ~/.config/nixos-manager:
___

* Раскомментируйте нужные видеодрайверы (NVIDIA/AMD)
* Настройте аудио
* Добавьте необходимые пакеты
#### Применяем изменения
```bash
rebuild  # алиас для "sudo nixos-rebuild switch"
```
Перезапускаемся
```bash
reboot
```

## 🧹 Финальная очистка
Если всё работает стабильно:
```bash
nix-clean  # алиас для очистки старых поколений
```
___
# 🎯 Доступные алиасы
*Находятся в пути:* <code>~/.config/home-manager/shell-aliases.nix</code>
#### Основные команды
* <code>rebuild</code> - **Ребилд системы** - 

<code>sudo nixos-rebuild switch</code>
* <code>hrebuild</code> - **Ребилд домашнего мереджера** - 

<code>home-manager switch</code>
#### Просмотр поколений
* <code>nix-list</code> - **Просмотр поколений Nix** - 

<code>sudo nix-env -p /nix/var/nix/profiles/system --list-generations</code>
* <code>home-list</code> - **Просмотр поколений Home** - 

<code>home-list = nix-env --list-generations -p ~/.local/state/nix/profiles/home-manager</code>
#### Откат системы
* <code>rollback</code> - **Откат системы Nix** - 

<code>sudo nixos-rebuild switch --rollback</code>
* <code>hm-rollback</code> - **Откат Home** - 

<code>home-manager switch --rollback</code>
#### Поиск пакетов (если есть экспериментальные функции)
* <code>nix-search</code> - **Пример: nix-search vscodium** - 

<code>nix search nixpkgs#</code>
#### Очистка
* <code>nix-clean</code> - **очистка старых поколений Nix** - 

<code>sudo nix-collect-garbage -d</code>
* <code>home-clean</code> - **очистка старых поколений Nix** - 

<code>nix-collect-garbage -d</code>
</details>

<details>
  <summary>English</summary>

---

## 📦 Installation

### 1. Install the system
Download NixOS to a USB stick from the [official website](https://nixos.org/download/).

Install a clean NixOS (see the [official manual](https://nixos.org/manual/nixos/stable/)).

Or follow any beginner-friendly guide on YouTube (easier option).

---

### 2. Clone the repository
```bash
git clone --depth 1 https://github.com/Wolfengo/nixos-configs
```

### 3. (Optional) Change the username
By default, the configs use `user`.
1. Open the folder:
```bash
cd /nixos-configs/.config/nixos-manager/users
```
2. Replace `user` with your actual username:
```bash
sed -i 's/users.users.user/users.users.YOUR_USERNAME/g' user.nix
```
```bash
mv user.nix YOUR_USERNAME.nix
```

### 4. First system build
1. Build:
```nix
nixos-rebuild switch -I nixos-config=/root/nixos-configs/.config/nixos-manager/configuration.nix
```
2. Reboot:
```bash
reboot
```

---

## 🔧 After the first login

### 1. User environment setup
1. After reboot, log in as your created user.
2. Move the configs to your home directory:
```bash
sudo mv -r /nixos-configs/.config ~/.config
```
3. Remove the leftover empty folder:
```bash
sudo rm -f /root/nixos-configs
```

### 2. Create a symbolic link
This allows you to manage NixOS configs from your home directory without `sudo`.
1. Backup the default config:
```bash
sudo mv /etc/nixos /etc/nixos.backup
```
2. Create a link:
```bash
sudo ln -s ~/.config/nixos-manager /etc/nixos
```
3. Move or create `hardware-configuration.nix`  

*This file is automatically created during installation by the command `nixos-generate-config`. It analyzes your hardware and generates the necessary configuration.*
```bash
cp /etc/nixos.backup/hardware-configuration.nix /etc/nixos/hardware-configuration.nix
```
Or:
```bash
nixos-generate-config
```

### 3. Build the user configuration
```bash
home-manager switch
```
Reboot:
```bash
reboot
```

---

## ⚙️ System fine-tuning
#### After reboot, go to the `nixos-manager` README
Edit configs in `~/.config/nixos-manager`:
___

* Uncomment the required video drivers (NVIDIA/AMD)  
* Configure audio  
* Add additional packages  

#### Apply changes:
```bash
rebuild  # alias for "sudo nixos-rebuild switch"
```
Reboot:
```bash
reboot
```

---

## 🧹 Final cleanup
If everything works stably:
```bash
nix-clean  # alias for cleanup of old generations
```

---

# 🎯 Available aliases
*Located at:* <code>~/.config/home-manager/shell-aliases.nix</code>

#### Main commands
* <code>rebuild</code> – **Rebuild the system** –  

<code>sudo nixos-rebuild switch</code>
* <code>hrebuild</code> – **Rebuild home manager** –  

<code>home-manager switch</code>

#### Generation overview
* <code>nix-list</code> – **List Nix generations** –  

<code>sudo nix-env -p /nix/var/nix/profiles/system --list-generations</code>
* <code>home-list</code> – **List Home generations** –  

<code>nix-env --list-generations -p ~/.local/state/nix/profiles/home-manager</code>

#### Rollback system
* <code>rollback</code> – **Rollback Nix system** –  

<code>sudo nixos-rebuild switch --rollback</code>
* <code>hm-rollback</code> – **Rollback Home** –  

<code>home-manager switch --rollback</code>

#### Package search (if experimental features enabled)
* <code>nix-search</code> – **Example: nix-search vscodium** –  

<code>nix search nixpkgs#</code>

#### Cleanup
* <code>nix-clean</code> – **Cleanup old Nix generations** –  

<code>sudo nix-collect-garbage -d</code>
* <code>home-clean</code> – **Cleanup old Home generations** –  

<code>nix-collect-garbage -d</code>
</details>
