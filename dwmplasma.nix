{ config, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "workman";
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
      windowManager.dwm.enable = true;
      libinput.enable = true;
    };
    teamviewer.enable = true;
    printing.enable = true;
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  nixpkgs.overlays = [
    (self: super: {
      dwm = super.dwm.overrideAttrs (old: { src = /etc/nixos/dwm ;});
      st = super.st.overrideAttrs (old: { src = /etc/nixos/st ;});
    })
  ];
}
