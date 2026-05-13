{ config, lib, ... }:
{
  config.userSettings = {
    lsp.rust-analyzer = {
      # Use RA from nixpkgs.
      binary = {
        path = lib.getExe config.pkgs.rust-analyzer;
        ignore_system_version = true;
      };

      initialization_options = {
        # Enable additional hints.
        inlayHints = {
          closureCaptureHints.enable = true;

          lifetimeElisionHints = {
            enable = "always";
            useParameterNames = true;
          };
        };
      };
    };
  };
}
