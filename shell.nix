
let
  nixpkgsSrc = builtins.fetchTarball {
    # nixpkgs master as of 2021-01-05
    url = https://github.com/NixOS/nixpkgs/archive/f53c431645da8e6760268092aa10f736b5cfb117.tar.gz;
    sha256 = "1n1ikc16ak8rylmn6bxq4dgxy0kniq4z36sm4i0cdf2hy5frwmqi";
  };

  nixpkgs = import nixpkgsSrc {};
in

with nixpkgs;

mkShell {
  name = "purescript-dev-shell";
  buildInputs = [
    nodejs
    purescript
    spago
  ];
}
