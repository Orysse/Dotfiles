declare -a packages=("zsh" "hyprland" "rofi-wayland" "waybar" "swww")
packages_len="${#packages[@]}"

echo "starting..."
(
for ((i=0; i<"${packages_len}"; i++ ));
do
    nix profile install "nixpkgs#${packages[$i]}"
    echo "installing ${packages[$i]} (${i+1}/${packages_len})"
done

)

echo "starting Hyprland"
exec Hyprland
