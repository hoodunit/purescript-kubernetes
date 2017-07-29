{ pkgs ? import ./pkgs.nix }:

pkgs.stdenv.mkDerivation {
  name = "purescript-kubernetes";
  src = ./.;
  buildInputs = [
    pkgs.nodejs-8_x
    pkgs.git
  ];
  buildPhase = ''
    HOME=. npm install
    export SSL_CERT_FILE=${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt
    HOME=. ./bower update --force-latest
    npm run build
  '';
  checkPhase = ''
    npm run test
  '';
  installPhase = ''
    mkdir -p $out
    cp -r app.js public node_modules $out/
  '';
}
