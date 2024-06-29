{ pkgs, ... }: {
  # here go the darwin preferences and config items
  # run darwin-help to see the available options
  # or go to https://daiderd.com/nix-darwin/manual/index.html
  programs.zsh.enable = true;
  environment = {
    shells = with pkgs; [ bash zsh ];
    loginShell = pkgs.zsh;
    systemPackages = [ pkgs.coreutils ];
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
    ];
  };
  services.nix-daemon.enable = true;
  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.15;
      appswitcher-all-displays = true;
    };
    ".GlobalPreferences" = {
      "com.apple.mouse.scaling" = 3.0;
    };
    NSGlobalDomain = {
      "com.apple.trackpad.scaling" = 3.0;
      InitialKeyRepeat = 10;
      KeyRepeat = 1;
    };
  };
  # Compatibility
  # https://daiderd.com/nix-darwin/manual/index.html#opt-system.stateVersion
  system.stateVersion = 4;
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.brewfile = true;
    masApps = { };
    casks = [
      "alacritty"
      "amethyst"
      "cool-retro-term"
      "firefox"
      "flux"
      "karabiner-elements"
      "monitorcontrol"
      "mos"
      "mullvadvpn"
      "orbstack"
      "signal"
      "transmission"
      "vlc"
    ];
  };
}
