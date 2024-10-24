{
    description = "Buttery Crispy Flake";

    # bring in these sources (git repos)
    inputs = {
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs.url = "github:nixos/nixpkgs";
        zen-browser.url = "github:MarceColl/zen-browser-flake";
        hyprland.url = "github:hyprwm/Hyprland";
    };

    # use them to output nixos config
    outputs = { nixpkgs, ... }@ inputs:
        let
            system = "x86_64-linux";

            # package config
            pkg = {
                system = "${system}";
                config = {
                    allowUnfree = true;
                    allowUnfreePredicate = _: true;
                };
            };
        in {
            # nixpkgs is still used when doing program.enable so make sure it matches our settings.
            nixpkgs.config = pkg.config;
            nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
                inherit system;
                # this passes inputs in a way that allows modules to "import" them
                specialArgs = { inherit inputs; };
                # modules to include
                modules = [ ./configuration.nix ];
            };
        };
}
