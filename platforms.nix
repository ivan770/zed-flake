mkPkgs:
let
  mkPlatform = system: {
    pkgs = mkPkgs { inherit system; };
    exports = [ "zed" ];
  };
in
{
  # Linux
  x86_64-linux = mkPlatform "x86_64-linux";
  aarch64-linux = mkPlatform "aarch64-linux";

  # macOS
  aarch64-darwin = mkPlatform "aarch64-darwin";
}
