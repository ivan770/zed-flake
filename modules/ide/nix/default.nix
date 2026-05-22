{ config, lib, ... }:
{
  config.userSettings = {
    # Nix LSP support is fairly limited anyway, so disabling
    # all language servers is preferrable in the current configuration.
    languages.Nix.enable_language_server = false;
  };
}
