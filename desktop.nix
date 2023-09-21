{ config, pkgs, lib, helix, ... }:

{
  networking.networkmanager.enable = true;  
  console.useXkbConfig = true; 
  nixpkgs.config.allowUnfree = lib.mkForce true;

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
      pkgs.st
      gcc
      gnumake
      vim 
      wget
      git
      gcc
      pkgs.barrier
#      pkgs.citrix_workspace
      pkgs.hack-font

      helix.packages."${pkgs.system}".helix
    ];
  };

}