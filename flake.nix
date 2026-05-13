{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    nix-appimage.url = "github:ralismark/nix-appimage";
    nix-appimage.inputs.nixpkgs.follows = "nixpkgs";

    wrappers.url = "github:lassulus/wrappers";
    wrappers.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      flake-parts,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } (
      _:
      let
        overlay = import ./overlay.nix inputs;

        mkPkgs =
          system: crossSystem:
          import nixpkgs {
            localSystem = { inherit system; };
            inherit crossSystem;
            overlays = [ overlay ];
          };
      in
      {
        systems = nixpkgs.lib.systems.flakeExposed;

        flake.overlays.default = overlay;

        perSystem =
          {
            lib,
            pkgs,
            system,
            ...
          }:
          let
            mkPkgs' = mkPkgs system;

            platforms = import ./platforms.nix mkPkgs';

            compatiblePlatforms = lib.filterAttrs (
              # Darwin does not support cross-compilation.
              _:
              { pkgs, ... }:
              if pkgs.stdenv.hostPlatform.isDarwin then pkgs.stdenv.buildPlatform.isDarwin else true
            ) platforms;

            nativePackages =
              let
                currentPlatform = compatiblePlatforms.${system};

                exportedPackages = lib.genAttrs currentPlatform.exports (p: currentPlatform.pkgs.zedPackages.${p});
              in
              if builtins.hasAttr system compatiblePlatforms then
                # If the current build platform can serve as a host platform,
                # expose the available exports as packages.
                (
                  exportedPackages
                  // {
                    # Provide the default package for convenience.
                    default = exportedPackages.zed;
                  }
                )
              else
                # Otherwise, provide only cross-platform builds.
                { };

            mkApps = lib.mapAttrs (_: program: { inherit program; });
          in
          {
            _module.args.pkgs = mkPkgs' {
              inherit system;
            };

            packages =
              let
                platformPackages = lib.mapAttrs (
                  s: { pkgs, exports }: lib.genAttrs exports (p: lib.nameValuePair "${s}-${p}" pkgs.zedPackages.${p})
                ) compatiblePlatforms;

                flattenedPackages = lib.collect (x: x ? name) platformPackages;
              in
              (lib.listToAttrs flattenedPackages) // nativePackages;

            apps = mkApps nativePackages;

            formatter = pkgs.nixfmt-tree;
          };
      }
    );
}
