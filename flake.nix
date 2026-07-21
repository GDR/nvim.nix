{
  description = "Standalone Neovim configuration with Lua-first config and Nix plugin management";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-wrapper-modules = {
      url = "github:BirdeeHub/nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-wrapper-modules }@inputs:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      mkNvim = pkgs: import ./dotfiles/package.nix {
        inherit inputs pkgs;
        lib = pkgs.lib;
      };
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          nvim = mkNvim pkgs;
        in
        {
          default = nvim;
          nvim = nvim;
        }
      );

      apps = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = {
            type = "app";
            program = "${self.packages.${system}.default}/bin/nvim";
          };
          nvim = {
            type = "app";
            program = "${self.packages.${system}.default}/bin/nvim";
          };
        }
      );

      checks = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          nvim = self.packages.${system}.default;
        in
        {
          default = pkgs.runCommand "check-nvim" { } ''
            ${nvim}/bin/nvim --version > $out
          '';
        }
      );
    };
}
