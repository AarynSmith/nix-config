{
  description = "Aaryn's Nix Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
outputs = { self, nixpkgs, darwin, home-manager, ... }:
  let
    # Shared settings between macOS + NixOS
    mkCommon = system: { pkgs, ... }: {
      nixpkgs.hostPlatform = system;

      nix.settings = {
        experimental-features = [ "nix-command" "flakes" ];
      };

      nixpkgs.config.allowUnfree = true;

      environment.systemPackages = with pkgs; [
        git
        # add other common CLI tools here
      ];
    };
  in {
    #####################
    ## macOS (nix-darwin)
    #####################

    darwinConfigurations."macbook-air" = darwin.lib.darwinSystem {
      system = "x86_64-darwin";  # Intel Mac

      modules = [
        (mkCommon "x86_64-darwin")
        ./hosts/macbook-air/darwin.nix

        # Home Manager integrated into nix-darwin
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users."aaryn" = import ./home/darwin/aaryn.nix;
          home-manager.sharedModules = [ ./home/common.nix ];
        }
      ];
    };

    #################
    ## Raspberry Pi 5
    #################

    nixosConfigurations."rpi5" = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";

      modules = [
        (mkCommon "aarch64-linux")
        ./hosts/rpi5/configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users."aaryn" = import ./home/nixos/aaryn.nix;
          home-manager.sharedModules = [ ./home/common.nix ];
        }
      ];
    };
  };
}

