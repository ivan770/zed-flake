{
  lib,
  pkgs,
  wlib,
  zed-editor,
}:
(wlib.wrapModule {
  imports = lib.fileset.toList (lib.fileset.fileFilter (f: f.name == "default.nix") ../modules);

  config = {
    inherit pkgs;
    package = zed-editor;
  };
}).wrapper
