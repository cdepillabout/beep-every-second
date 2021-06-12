
# Beep Every Second

This is a very simple web application that has a button that causes a timer to
beep every second.

This is available at: https://cdepillabout.github.io/beep-every-second/

## Developing Locally

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

## Publishing to GitHub Pages

Updating the GitHub Pages site linked above can be done with the following command:

```console
$ npm run build-prod
```

This updates the release-ready app in `./docs`.  Commit these changes to
`master` and the updates will be live.
