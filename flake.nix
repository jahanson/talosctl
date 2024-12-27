{
  description = "A CLI for out-of-band management of Kubernetes nodes created by Talos";

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
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = rec {
          talosctl = pkgs.callPackage ./default.nix { };
          default = talosctl;
        };
      }
    );
}
