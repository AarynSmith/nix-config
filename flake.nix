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
  outputs =
    {
      self,
      nixpkgs,
      darwin,
      home-manager,
      ...
    }:
    let
      # Shared settings between macOS + NixOS
      mkCommon =
        system:
        { pkgs, ... }:
        {
          nixpkgs.hostPlatform = system;

          nix.settings = {
            experimental-features = [
              "nix-command"
              "flakes"
            ];

            # ssl-cert-file = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
            # flake-registry = "https://raw.githubusercontent.com/NixOS/flake-registry/master/flake-registry.json";
            flake-registry = "file:///etc/nix/flake-registry.json";

          };

          nixpkgs.config.allowUnfree = true;

          environment.systemPackages = with pkgs; [
            git
            # add other common CLI tools here
          ];
          fonts.packages = with pkgs; [
            nerd-fonts.fira-code
            fira-code-symbols
            monaspace
            victor-mono
          ];
        };
    in
    {
      #####################
      ## macOS (nix-darwin)
      #####################

      darwinConfigurations."Aaryns-MacBook-Air" = darwin.lib.darwinSystem {
        system = "x86_64-darwin"; # Intel Mac

        modules = [
          (mkCommon "x86_64-darwin")
          ./hosts/Aaryns-MacBook-Air/darwin.nix
          ./modules/desktop/options.nix
          ./modules/desktop/vscodium-darwin.nix

          # Home Manager integrated into nix-darwin
          home-manager.darwinModules.home-manager
          {
            # Home Manager root options
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "hm-bak";

            # Home Manager users
            home-manager.users."aaryn" = import ./home/darwin/aaryn.nix;

            # Shared HM Modules
            home-manager.sharedModules = [
              ./home/common.nix
              ./home/modules/desktop
            ];
          }
        ];
      };
      darwinConfigurations."Aaryns-MacBook-Pro" = darwin.lib.darwinSystem {
        system = "aarch64-darwin"; # Apple Mac

        modules = [
          (mkCommon "aarch64-darwin")
          ./hosts/Aaryns-MacBook-Pro/darwin.nix
          ./modules/desktop/options.nix
          ./modules/desktop/vscodium-darwin.nix


          # Home Manager integrated into nix-darwin
          home-manager.darwinModules.home-manager
          {
            # Home Manager root options
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "hm-bak";

            # Home Manager users
            home-manager.users."aaryn" = import ./home/darwin/aaryn.nix;

            # Shared HM Modules
            home-manager.sharedModules = [
              ./home/common.nix
              ./home/modules/desktop
            ];
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
