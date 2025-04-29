# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
	config,
	pkgs,
  lib,
	...
}:
{
  # Allow unstable packages
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      unstable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") {
        config = config.nixpkgs.config;
      };
    };
  };

  # Dark mode
  # Required for some apps to follow dark mode (requires the adw-gtk3 package)
  programs.dconf = {
    enable = true;
    profiles.user.databases = [{
      settings = with lib.gvariant; {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          gtk-theme = "adw-gtk3-dark";
        };
      };
    }];
  };

  # Install packages
  environment.systemPackages = with pkgs; [
    adw-gtk3 # needed for dark mode
    wev # find key codes
    brightnessctl # to control backlight
    nodejs
    node-gyp
    neofetch
    btop
    docker
    vim
    git
    bun
    unzip
    pnpm
    bun
    wofi
    unstable.waybar # status bar
    unstable.brave
    kitty # terminal
    unstable.zed-editor
    unstable.code-cursor
    vscode
    signal-desktop
    slack
    discord
    ulauncher # app launcher
    xorg.xbacklight # to control backlight
    blueman # for bluetooth ui
    networkmanagerapplet
    hyprshot
    hyprpaper
  ];

  pkgs.mkShell {
    buildInputs = with pkgs; [
        nodejs_20
        nodePackages.yarn
        nodePackages.node-gyp
        vips
        python3
        prisma-engines
        openssl
    ];

    shellHook = ''
        export PRISMA_SCHEMA_ENGINE_BINARY="${pkgs.prisma-engines}/bin/schema-engine"
        export PRISMA_QUERY_ENGINE_BINARY="${pkgs.prisma-engines}/bin/query-engine"
        export PRISMA_QUERY_ENGINE_LIBRARY="${pkgs.prisma-engines}/lib/libquery_engine.node"
        export PRISMA_FMT_BINARY="${pkgs.prisma-engines}/bin/prisma-fmt"
        export PATH="$PWD/node_modules/.bin/:$PATH"
    '';
  }

  # Enable other programs
  programs.hyprland.enable = true;

  # Docker config
  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [ "qudo" ];
  networking.hostName = "nixos";

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.dbus.packages = [ pkgs.blueman ];
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "";
  # Enable CUPS to print documents.
  services.printing.enable = true;
  # Enable SSH
  services.openssh.enable = true;
  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Locale
  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Fonts
  fonts.packages = with pkgs; [ nerdfonts ];

  # User
  users.users.qudo = {
    isNormalUser = true;
    description = "qudo";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  system.stateVersion = "24.11"; # Don't change (or go read the docs)
}
