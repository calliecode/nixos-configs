{
  description = "work flake";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    helix.url = "github:helix-editor/helix/23.05";
  };
  
  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      "calliopebailey" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
          ./calliopebailey.nix
        ];
      };
    };
  };
}
