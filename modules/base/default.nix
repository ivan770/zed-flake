{
  config,
  lib,
  wlib,
  ...
}:
let
  jsonFormat = config.pkgs.formats.json { };
in
{
  options = {
    userSettings = lib.mkOption {
      inherit (jsonFormat) type;
      default = { };
      description = ''
        Zed user settings.
      '';
    };

    userSettingsFile = lib.mkOption {
      type = wlib.types.file config.pkgs;
      default.path = jsonFormat.generate "zed-user-settings.json" config.userSettings;
      description = ''
        Path to the generated user settings file.
      '';
    };
  };

  config = {
    preHook = ''
      mkdir -p ~/.config/zed

      rm -f ~/.config/zed/settings.json
      ln -s ${config.userSettingsFile.path} ~/.config/zed/settings.json
    '';
  };
}
