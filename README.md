
## Running

This repo can be hacked on by running the following commands.

First, enter into a Nix shell with all dependencies available:

```console
$ nix-shell
```

Then, within the nix shell, build the PureScript app with `spago build --watch`:

```console
$ npm run watch
```

In a separate console, run Parcel to handle the HTML and JavaScript:

```console
$ npm run serve
```
