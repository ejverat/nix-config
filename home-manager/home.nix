# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ./nixvim
    ./btop.nix
    ./direnv.nix
    ./hyprland.nix
    ./mako.nix
    ./neovim.nix
    ./rofi.nix
    ./tmux.nix
    ./waybar.nix
    ./wezterm.nix
    ./zsh.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  # TODO: Set your username
  home = {
    username = "ejverat";
    homeDirectory = "/home/ejverat";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];
  home.packages = with pkgs; [
    bat
    brightnessctl
    clippy
    cowsay
    devenv
    eza
    glow
    hyprshot
    kmonad
    mise
    prusa-slicer
    ripgrep
    rofi-wayland
    rofi-power-menu
    skim
    swaybg
    thefuck
    wl-clipboard
    zsh-powerlevel10k
    spotube
    python312Packages.deemix
    mplayer
    lazygit
    pavucontrol
    blueman
    flameshot
    redshift
    discord
    hyprshot
    sway
    webcamoid
    teams-for-linux
    zoom-us
    # kicad dependencies
    # kicad-unstable
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}

# { pkgs, ... }:
# let
#   pkgsUnstable = import <nixpkgs-unstable> { };
# in
# {
#   # Home Manager needs a bit of information about you and the
#   # paths it should manage.
#   home.username = "ejverat";
#   home.homeDirectory = "/home/ejverat";
#
#   nixpkgs.config.allowUnfreePredicate = _: true;
#
#   # This value determines the Home Manager release that your
#   # configuration is compatible with. This helps avoid breakage
#   # when a new Home Manager release introduces backwards
#   # incompatible changes.
#   #
#   # You can update Home Manager without changing this value. See
#   # the Home Manager release notes for a list of state version
#   # changes in each release.
#   home.stateVersion = "24.05";
#
#   # Let Home Manager install and manage itself.
#   programs.home-manager.enable = true;
#   targets.genericLinux.enable = true;
#
#   #pkgs.chromium
#   # pkgsUnstable.prusa-slicer
#   home.packages = [
#     pkgs.bat
#     pkgs.brightnessctl
#     pkgs.clippy
#     pkgs.cowsay
#     pkgs.devenv
#     pkgs.eza
#     pkgs.fira-code-nerdfont
#     pkgs.glow
#     pkgs.hyprshot
#     pkgs.kmonad
#     pkgs.mise
#     pkgs.prusa-slicer
#     pkgs.ripgrep
#     pkgs.rofi-wayland
#     pkgs.rofi-power-menu
#     pkgs.skim
#     pkgs.swaybg
#     pkgs.thefuck
#     pkgs.wl-clipboard
#     pkgs.zsh-powerlevel10k
#   ];
# }
