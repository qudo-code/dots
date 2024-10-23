{ inputs, ... }: { config, ... }:  {
    description = "Buttery Crispy Constants";

    outputs = { ... }: {
        system = "x86_64-linux";

        # user config
        user = "qudo";
        hostname = "nixos";
        github = {
            username = "qudo-code";
            email = "qudo@matr.world";
        };

        # package config
        pkg = {
            system = "${system}";
            config = {
                allowUnfree = true;
                allowUnfreePredicate = _: true;
            };
        };

        pkgs = import inputs.nixpkgs pkg;
        unstable = import inputs.nixpkgs-unstable pkg;
    }
}
