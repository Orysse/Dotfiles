{ config, pkgs, ... }:

{
  imports = [
    ./starship.nix
  ];

  programs.zsh = {
    enable = true;
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.4.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
    ];
    shellAliases = {
      v = "nvim";
      ls = "lsd";
      c = "clear";
      hrc = "nvim ~/.dotfiles/user/home.nix";
      config = "nvim ~/.dotfiles/configuration.nix";
      rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles/";
      home = "home-manager switch --flake ~/.dotfiles/";
    };
    /* prezto = {
           enable = true;
           tmux = {
           autoStartLocal = true;
           autoStartRemote = true;
           defaultSessionName = "Default";
           };
           }; */
  };
}