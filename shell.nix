
let
  nixpkgsSrc = builtins.fetchTarball {
    # nixpkgs unstable as of 2021-06-12
    url = https://github.com/NixOS/nixpkgs/archive/51bb9f3e9ab6161a3bf7746e20b955712cef618b.tar.gz;
    sha256 = "1bqla14c80ani27c7901rnl37kiiqrvyixs6ifvm48p5y6xbv1p7";
  };

  nixpkgs = import nixpkgsSrc {};
in

with nixpkgs;

mkShell {
  name = "purescript-dev-shell";
  buildInputs = [
    nodejs
    nodePackages.parcel-bundler
    purescript
    purescript-psa
    spago
  ];
}
