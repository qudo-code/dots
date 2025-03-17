# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
	config,
	pkgs,
	...
}:
{  
  # Install packages
  environment.systemPackages = with pkgs; [
    wev
    brightnessctl
    nodejs
    node-gyp
    docker
    vim
    git
    bun
    unzip
    wofi
    unstable.waybar
    unstable.brave
    kitty
    unstable.zed-editor
    unstable.code-cursor
    vscode
    signal-desktop 
    slack
    discord
    ulauncher
    xorg.xbacklight
  ];

  # Enable other programs
  programs.firefox.enable = true;
  programs.hyprland.enable = true;

  # Docker config
  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [ "qudo" ];

  # How to WIFI:
  # Had issues getting things to connect with nmcli but for some reason
  # switching to Gnome, adding the network there, then coming back works.
  # nmcli device wifi connect <SSID> password <password>
  networking.hostName = "nixos";

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman-applet.enable = true;
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

  # Allow unstable packages
  nixpkgs.config = {
    allowunfree = true;
    packageOverrides = pkgs: {
      unstable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") {
        config = config.nixpkgs.config;
      };
    };
  };

  # Host
  networking.hostName = "nixbook";

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

