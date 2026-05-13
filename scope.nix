{
  callPackage,
  lib,
  ...
}:
lib.packagesFromDirectoryRecursive {
  inherit callPackage;
  directory = ./packages;
}
