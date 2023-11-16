{

    description = "Abelc's Flake";

    inputs ={
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager/master";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        nix-colors.url = "github:misterio77/nix-colors";
    };

    outputs = { self, nixpkgs, home-manager, ...}@inputs:
    let
        lib = nixpkgs.lib;
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {
        nixosConfigurations = {
            Le-prepus-de-Dov = lib.nixosSystem {
                inherit system;
                modules = [ ./system/configuration.nix ];
            };
        };
        homeConfigurations = {
            abelc = home-manager.lib.homeManagerConfiguration {
                extraSpecialArgs = { inherit inputs; };
                inherit pkgs;
                modules = [ ./user/home.nix ];
            };
        };

    };

}
