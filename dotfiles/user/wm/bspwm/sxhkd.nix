{
  services.sxhkd = {
    enable = true;
    keybindings = {
      "super + {Return, d, p}" = "{alacritty, rofi -show drun, ~/.config/rofi/leave.sh}";
      "super + {_,shift + }q" = "bspc node -{c,k}";
      "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";
      "super + {_,shift + }{Left,Down,Up,Right}" = "bspc node -{f,s} {west,south,north,east}";
      "alt + Tab" = "bspc node -f last.local";
      "super + g" = "bspc node -s biggest";
      "super + f" = "bspc node -t \"~\"{floating,tiled}";
    };
  };
}
