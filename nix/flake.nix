# flake.nix
{
  description = "Buttery Crispy Flake";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs";

    zen-browser.url = "github:MarceColl/zen-browser-flake";

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, ... }@ inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      unstable = import inputs.nixpkgs-unstable { inherit system; };
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; }; # this is the important part
        modules = [ ./configuration.nix ];
      };
    };
}
