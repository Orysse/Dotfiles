{ config, pkgs, inputs, ... }:

{
  home.username = "abelc";
  home.homeDirectory = "/home/abelc";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./wm/bspwm/bspwm.nix
    ./apps/shell/zsh/zsh.nix
    ./apps/notify/dunst.nix
    ./apps/terminal/alacritty/alacritty.nix
    ./apps/editor/nvim/nvim.nix
    ./apps/utils/default.nix
    ./apps/browser/qute.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.everforest;

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    #languages
    python3
    nixpkgs-fmt

    #lsp
    ccls
    lua-language-server
    python311Packages.python-lsp-server
    haskell-language-server
    rnix-lsp

    #apps
    alacritty
    btop
    discord
    dunst
    feh
    firefox
    lsd
    neofetch
    pavucontrol
    polybar
    rofi
    steam
    swww
    xmobar
    spotify

    #utils
    gnumake
    xclip

    # (callPackage ./packages/discord-screenaudio.nix {})

  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
