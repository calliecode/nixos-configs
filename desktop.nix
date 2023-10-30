{ config, pkgs, lib, helix, ... }:

{
  networking.networkmanager.enable = true;  
  console.useXkbConfig = true; 
  nixpkgs.config.allowUnfree = lib.mkForce true;

  boot.loader.systemd-boot.configurationLimit = 10;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  nix.settings.auto-optimise-store = true;

  users.users.calliope = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; 
    packages = with pkgs; [
      firefox
      tmux
      fzy
      neofetch
      man
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
      pkgs.lsof

      pkgs.glibc_multi
      pkgs.glib-networking
      pkgs.microsoft-edge
      pkgs.teams
    
      gnome.gnome-keyring
    ];
  };

  services.teamviewer.enable = true;

  environment = {
    variables.EDITOR = "hx";
    systemPackages = with pkgs; [
      git
      pkgs.st
      gcc
      gnumake
      vim 
      wget
      pkgs.barrier
#      pkgs.citrix_workspace
      pkgs.hack-font

      helix.packages."${pkgs.system}".helix
    ];
  };

}