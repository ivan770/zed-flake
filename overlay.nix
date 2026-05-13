inputs: final: prev: {
  wlib = inputs.wrappers.lib;

  zedPackages = prev.callPackage ./scope.nix { };
}
