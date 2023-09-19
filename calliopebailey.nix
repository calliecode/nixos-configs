{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./base.nix
      ./dwmplasma.nix
      ./desktop.nix
    ];

  networking.hostName = "calliopebailey";
  system.stateVersion = "22.11"; 
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
}

