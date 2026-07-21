{
  description = "Standalone Neovim configuration flake wrapped with nix-wrapper-modules";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-wrapper-modules = {
      url = "github:BirdeeHub/nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nix-wrapper-modules }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          wrappedNeovim = import ./dotfiles/package.nix {
            inherit inputs pkgs;
            lib = pkgs.lib;
          };
        in
        {
          default = wrappedNeovim;
          nvim = wrappedNeovim;
        }
      );

      apps = forAllSystems (system:
        let
          pkg = self.packages.${system}.default;
        in
        {
          default = {
            type = "app";
            program = "${pkg}/bin/nvim";
          };
          nvim = {
            type = "app";
            program = "${pkg}/bin/nvim";
          };
        }
      );

      checks = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          neovim = self.packages.${system}.default;
        in
        {
          neovim-config = pkgs.runCommand "neovim-config-check"
            {
              nativeBuildInputs = [ neovim ];
            } ''
            export HOME="$TMPDIR/home"
            export XDG_CONFIG_HOME="$TMPDIR/config"
            export XDG_DATA_HOME="$TMPDIR/data"
            export XDG_STATE_HOME="$TMPDIR/state"
            export XDG_CACHE_HOME="$TMPDIR/cache"
            export NVIM_LOG_FILE="$TMPDIR/nvim.log"

            mkdir -p "$HOME" "$XDG_CONFIG_HOME" "$XDG_DATA_HOME" "$XDG_STATE_HOME" "$XDG_CACHE_HOME"
            cp -R ${./dotfiles/nvim} "$XDG_CONFIG_HOME/nvim"
            chmod -R u+w "$XDG_CONFIG_HOME/nvim"

            nvim --headless -c "luafile ${./tests/check.lua}"

            touch "$out"
          '';
        }
      );

      homeManagerModules = rec {
        nvim = { config, lib, pkgs, ... }: {
          home.packages = [ self.packages.${pkgs.stdenv.hostPlatform.system}.default ]
            ++ (with pkgs; [ ripgrep fzf fd ])
            ++ lib.optionals pkgs.stdenv.isLinux [ pkgs.wl-clipboard ];

          xdg.configFile."nvim".source = ./dotfiles/nvim;
        };
        default = nvim;
      };
    };
}
