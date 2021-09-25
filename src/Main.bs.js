// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Curry = require("rescript/lib/js/curry.js");
var State = require("./State.bs.js");
var Prompt = require("./Prompt.bs.js");

function getDirectoriesFromUser(dispatch) {
  return Prompt.ask("Provide a directory path. Press Ctrl + C to exit. \n").then(function (msg) {
              Curry._1(dispatch, msg);
              return Promise.resolve(msg);
            });
}

function main(_state) {
  while(true) {
    var state = _state;
    var match = State.context(state);
    var state$1 = match.state;
    var isDone = state$1.contents === /* Done */2;
    if (isDone) {
      return ;
    }
    _state = state$1.contents;
    continue ;
  };
}

main(/* Init */0);

exports.getDirectoriesFromUser = getDirectoriesFromUser;
exports.main = main;
/*  Not a pure module */