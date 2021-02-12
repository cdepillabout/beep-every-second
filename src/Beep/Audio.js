
"use strict";

exports.playAudio = audio => () => audio.play();

exports.newAudio = path => () => new Audio(path);
