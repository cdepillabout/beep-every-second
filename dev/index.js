let Main = require('../output/Main/index.js');

// Need to load the audio from JavaScript and pass it into PureScript so that
// Parcel knows to bundle it.
let audioUrl = require('./ding-sound-effect.mp3');
let beepAudio = new Audio(audioUrl);

// HMR stuff
// For more info see: https://parceljs.org/hmr.html
if (module.hot) {
  module.hot.accept(function () {
    console.log('index.js, reloaded and running Main.main() again');
    Main.main();
  });
}

console.log('index.js, running Main.main()');
Main.main(beepAudio)();
