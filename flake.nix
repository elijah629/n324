{
  description = "Development environment with Ruby and dependencies";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          name = "env";

          buildInputs = with pkgs; [
            ruby
            git
            sqlite
            libpcap
            postgresql
            libxml2
            libxslt
            pkg-config
            bundix
            gnumake
          ];
        };
      }
    );
}
