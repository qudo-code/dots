{
    description = "Buttery Crispy Flake";

    # bring in these sources (git repos)
    inputs = {
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs.url = "github:nixos/nixpkgs";
        zen-browser.url = "github:MarceColl/zen-browser-flake";
        hyprland.url = "github:hyprwm/Hyprland";
        machine-flake = {
            url = "path:./nix/machine/flake.nix";
        };
    };

    # use them to output nixos config
    outputs = { ... }@ inputs:
        let
            # machineModule = import ./machine.nix;
            machine = my_thing = pkgs.callPackage ./nix/machine/flake.nix {
                inherit inputs;
            };

            pkgs = machine.pkgs;
            system = machine.system;
        in {
            nixosConfigurations.nixos = pkgs.lib.nixosSystem {
                inherit system;
                # this passes inputs in a way that allows modules to "import" them
                specialArgs = { inherit inputs; };
                # modules to include
                modules = [ ./configuration.nix ];
            };
        };
}
