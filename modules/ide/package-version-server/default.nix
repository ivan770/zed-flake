{ config, lib, ... }:
{
  config.userSettings = {
    # Use package-version-server from nixpkgs.
    lsp.package-version-server.binary = {
      path = lib.getExe config.pkgs.package-version-server;
      ignore_system_version = true;
    };
  };
}
