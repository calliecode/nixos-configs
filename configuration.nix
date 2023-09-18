{ config, pkgs, ... }:

{
imports =
  [ 
    ./hardware-configuration.nix
  ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

networking = {
  hostName = "calliopebailey";
  networkmanager.enable = true;  
  #remember the www.
  extraHosts = 
    ''
      67.225.188.48 toto
      67.225.240.211 ds2
      10.11.12.217 munchpi
      40.119.44.221 bi
      67.225.188.48 mtte.pro
      67.225.188.48 www.mtte.pro
    '';
};
  
boot.loader.systemd-boot.enable = true;
boot.loader.systemd-boot.graceful = true;
boot.loader.efi.canTouchEfiVariables = true;


nixpkgs.config.allowUnfree = true;

time.timeZone = "America/Chicago";

i18n.defaultLocale = "en_US.UTF-8";
console = {
  font = "Lat2-Terminus16";
  useXkbConfig = true; 
};

services.xserver.enable = true;
services.xserver = {
  layout = "us";
  xkbVariant = "workman";
  displayManager.sddm.enable = true;
  desktopManager.plasma5.enable = true;
  windowManager.dwm.enable = true;
};

services.teamviewer.enable = true;

nixpkgs.overlays = [
  (self: super: {
    dwm = super.dwm.overrideAttrs (old: { src = /etc/nixos/dwm ;});
    st = super.st.overrideAttrs (old: { src = /etc/nixos/st ;});
  })
];

services.printing.enable = true;

sound.enable = true;
hardware.pulseaudio.enable = true;

services.xserver.libinput.enable = true;

users.users.calliope = {
  isNormalUser = true;
  extraGroups = [ "wheel" ]; 
  packages = with pkgs; [
    firefox
    tmux
    fzy
    neofetch
    whois
    gimp
    pkgs.azuredatastudio
    pkgs.nethack
    pkgs.lynx
    pkgs.sxhkd
    pkgs.feh
    pkgs.ed
    pkgs.xclip
    pkgs.xkcdpass
    pkgs.genpass
    pkgs.dig
    pkgs.cargo
    pkgs.rustc
    pkgs.stow
    pkgs.sshfs
    pkgs.newsboat
    pkgs.xscreensaver
    pkgs.teamviewer
    pkgs.inetutils
    pkgs.p7zip
    pkgs.direnv
    pkgs.zathura
    pkgs.libreoffice

    pkgs.glibc_multi
    pkgs.glib-networking
    pkgs.microsoft-edge
    pkgs.teams
    
    gnome.gnome-keyring
  ];
};

environment = {
  variables.EDITOR = "hx";
  systemPackages = with pkgs; [
    pkgs.st
    gcc
    gnumake
    vim 
    wget
    git
    helix
    gcc
    pkgs.barrier
    pkgs.citrix_workspace
    pkgs.hack-font
  ];
};

services.openssh.enable = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
networking.firewall.enable = false;

system.stateVersion = "22.11"; 

}

