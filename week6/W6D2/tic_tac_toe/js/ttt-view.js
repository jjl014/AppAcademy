class View {
  constructor(game, $el) {
    this.setupBoard.bind($el)();
    this.game = game;
    this.bindEvents();
  }

  bindEvents(completionCB) {
    const $cells = $(".cell");
    $cells.on("click", event => {
      const $currentTarget = $(event.currentTarget);
      try{
        this.makeMove($currentTarget);
      }catch(e){
        alert(e.msg);
      }
    });
  }

  makeMove($square) {
    // debugger;
    const cellPos = $square.data("pos");
    this.game.playMove(cellPos);
    const [row, col] = cellPos;
    const symbol = this.game.board.grid[row][col];
    $square.html(symbol);
    $square.removeClass('unrevealed');
    $square.addClass('revealed');
    if (symbol === 'x'){
      $square.css('color', 'blue');
    }else{
      $square.css('color', 'red');
    }
    if (this.game.isOver()){
      setTimeout(() => {
        if (this.game.winner()) {
          alert(`Player ${this.game.board.winner()} Won!`);
        } else {
          alert("No winner.");
        }
      }, 25);
    }
  }

  setupBoard() {
    const $ul = $('<ul></ul>');
    for(let i = 0; i < 3; i++){
      for(let j = 0; j < 3; j++){
        const $li = $(`<li class="cell unrevealed"></li>`);
        $li.data("pos", [i, j]);
        $ul.append($li);
      }
    }
    this.append($ul);

  }
}

module.exports = View;
