{
  description = "hatredholder's NixOS & Home-Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nur.url = "github:nix-community/nur";

    impermanence.url = "github:nix-community/impermanence";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nur, hm, ... } @ inputs:
  let
    secrets = builtins.fromJSON (builtins.readFile "${self}/secrets/secrets.json");
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        nur.overlay
      ];
      config.allowUnfree = true; # allow unfree nur packages
    };
  in
  {
    nixosConfigurations = {
      "pc" = lib.nixosSystem {
        specialArgs = { inherit inputs; inherit secrets;};
        modules = [ 
          inputs.disko.nixosModules.default
          inputs.impermanence.nixosModules.impermanence

          ./hosts/pc
          hm.nixosModules.home-manager
          {
            home-manager = { 
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs pkgs; };

              users.hatredholder.imports = [
                ./home
              ]; 
            };
          }
        ];
      };
      "x230" = lib.nixosSystem {
        specialArgs = { inherit inputs; inherit secrets;};
        modules = [ 
          ./hosts/x230
          hm.nixosModules.home-manager
          {
            home-manager = { 
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs pkgs; };

              users.hatredholder.imports = [
                ./home
              ]; 
            };
          }
        ];
      };
    };
  };
}
