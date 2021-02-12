console.log('index.js, running Main.main() 1');
var Main = require('../output/Main/index.js');

// HMR stuff
// For more info see: https://parceljs.org/hmr.html
if (module.hot) {
  module.hot.accept(function () {
    console.log('index.js, reloaded and running Main.main() again');
    Main.main();
  });
}

console.log('index.js, running Main.main() 2');
Main.main();
