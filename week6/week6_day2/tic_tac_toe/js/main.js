const View = require('./ttt-view');// require appropriate file
const Game = require('../src/game');// require appropriate file

$( () => {
  // Your code here
  const game = new Game();
  const $grid = $('figure.ttt');
  const view = new View(game, $grid);
});
