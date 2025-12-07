### ***ARCHINSTALL CONFIG***

---

## **Network Setup**

### **IWCTL (Wi-Fi)**
Enter iwctl:
```bash
iwctl
device list
station wlan0 scan
station wlan0 get-networks
station wlan0 connect "wifi-name"
```

---

## **Mirror Ranking**
Using Reflector (with backup and reliability tweaks):
```bash
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo reflector --country 'United States,India,Singapore' --latest 20 --protocol https --sort score --save /etc/pacman.d/mirrorlist
```

---

## **Package Installation**

### **Core Tools**
```bash
sudo pacman -S --needed git base-devel fwupd curl rsync wget zip unzip man power-profiles-daemon amd-ucode htop fastfetch partitionmanager vulkan-radeon linux-headers linux-lts linux-lts-headers linux-firmware sof-firmware networkmanager network-manager-applet xdg-desktop-portal-kde flatpak firewalld fish kwalletmanager kdeconnect kcalc filelight pacman-contrib ffmpegthumbs bluez bluez-utils bash-completion
```

### **Development**
```bash
sudo pacman -S --needed go rust zed
```

### **Desktop Apps**
```bash
sudo pacman -S --needed okular ark syncthing kamoso gwenview p7zip unrar chromium timeshift fzf nnn gnupg gcr tmux zellij
```

### **System Fonts**
```bash
sudo pacman -S --needed noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-firacode-nerd
```

---

## **Pacman Configuration**
Edit `/etc/pacman.conf` and enable:
```
Color
ILoveCandy
ParallelDownloads = 5
VerbosePkgLists
```

---

## **Setup AUR (paru)**
```bash
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

---

## **Firewalld Setup**
```bash
sudo pacman -S --needed firewalld plasma-firewall python-pyqt6
sudo systemctl enable --now firewalld
sudo firewall-cmd --set-default-zone=public
sudo firewall-cmd --permanent --add-service=dhcpv6-client
sudo firewall-cmd --reload
```
Enable KDE Plasma applet for firewall management | check for applet dependeries.

---

## **VirtualBox Setup**
```
sudo pacman -S virtualbox virtualbox-host-modules-arch
sudo pacman -S virtualbox-host-dkms
sudo pacman -S linux-lts-headers
sudo modprobe vboxdrv

```

---
## Syncthing Setup
```
sudo pacman -Syu --needed syncthing
systemctl --user enable syncthing.service
systemctl --user start syncthing.service
systemctl --user status syncthing
systemctl --user stop syncthing
http://localhost:8384
sudo ufw allow 8384/tcp   # If having trouble with firewalld

```
---
## GPG Key Generation & Kwallet Integration
```
sudo pacman -S gnupg gce (pinentry or pinentry-qt)
gpg --full-generate-key
Choose 1. RSA and RSA
keysize: 4092
expiration 0
gpg --list-secret-keys
open kwallet manager and create a new wallet using gpg encryption
```

---
## **Flatpak Apps**
Add Flathub repo:
```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```
Install apps:
```bash
flatpak install flathub com.rtosta.zapzap org.onlyoffice.desktopeditors com.github.ADBeveridge.Raider com.protonvpn.www org.qbittorrent.qBittorrent org.keepassxc.KeePassXC org.cryptomator.Cryptomator io.ente.auth io.github.giantpinkrobots.flatsweep io.github.kolunmi.Bazaar org.telegram.desktop
```

---

## **AUR Packages**
Install packages:
```bash
paru -S --needed brave-bin vscodium-bin ani-cli librewolf-bin
```

---

## **Firmware Updates**
Plug to charging mode during this
```bash
sudo pacman -S --needed fwupd
sudo fwupdmgr get-devices
sudo fwupdmgr refresh
sudo fwupdmgr get-updates
sudo fwupdmgr update
```

---

## **Bootloader (systemd-boot)**
```bash
sudo bootctl update
bootctl list
sudo mkinitcpio -P
```

---

## **Backup Configs**
```bash
pacman -Qqe > pkglist.txt
sudo tar czf etc-backup.tar.gz /etc
```

---

## **Edit system.conf (Boot Optimizations)**
Before making changes, ensure you back up the original configuration:
```bash
sudo cp /etc/systemd/system.conf /etc/systemd/system.conf.bak
```

Edit `/etc/systemd/system.conf` and set:
```ini
[Manager]
DefaultTimeoutStartSec=10s
DefaultTimeoutStopSec=10s
DefaultTasksMax=75%
DefaultCPUAccounting=yes
```

Reload systemd to apply changes:
```bash
sudo systemctl daemon-reexec
```

---

## **Bootloader & Kernel Phase Optimizations**

### **Reduce Loader Delay**
Edit systemd-boot configuration to reduce menu timeout:
```bash
sudo nano /boot/loader/loader.conf
```
Set:
```
timeout 1
```
(or `0` for instant boot into the default entry).

---
## **System Maintance**
Blah Bla Blayh
```bash
# update system
sudo pacman -Syu
# update AUR packages using paru
paru -Syu
# update flatpaks
flatpak update
# keep last 3 versions of packages in cache
sudo paccache -rk3
# remove unused packages (dry-run first!)
sudo pacman -Qtdq # list orphans
sudo pacman -Rns $(pacman -Qtdq) # remove orphans
# clean paru cache
paru -Sc
# regenerate initramfs after kernel mods
sudo mkinitcpio -P
# update systemd-boot after kernel updates
sudo bootctl update
```
