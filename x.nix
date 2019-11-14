{ pkgs, lib, ... }: {
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = false;
    };
    displayManager = {
      lightdm.enable = lib.mkForce false;
      job.execCmd = lib.mkDefault "true";
    };
    autorun = false;
    exportConfiguration = true;
    layout = "eu,de";
    xkbModel = "pc105";
    xkbVariant = "nodeadkeys";

  };

  hardware.pulseaudio = {
    enable = true;
    daemon.config.flat-volumes = "no";
    extraConfig = ''
      unload-module module-gsettings
    '';
  };
  services.printing.enable = true;

  programs = {
    slock.enable = true;
    gnupg.agent.enable = true;
  };

  fonts.fonts = with pkgs; [
    anonymousPro
    noto-fonts
  ];

  nixpkgs.overlays = [ (self: super: {
    dunst = super.dunst.override { dunstify = true; };
  }) ];

  security.sudo.extraConfig = ''
    schaefkn ALL=(ALL) NOPASSWD: /run/current-system/sw/bin/tee /sys/class/backlight/intel_backlight/brightness
  '';

  environment.pathsToLink = [ "/share/passff-host" ];
}
