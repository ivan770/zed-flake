# Assuming flakes are not available on the system,
# it makes sense to serve at least the minimal configuration through default.nix.
let
  flake-compat = fetchTarball {
    url = "https://github.com/edolstra/flake-compat/archive/refs/tags/v1.1.0.tar.gz";
    sha256 = "sha256:19d2z6xsvpxm184m41qrpi1bplilwipgnzv9jy17fgw421785q1m";
  };
in
(import flake-compat {
  src = ./.;
}).defaultNix
