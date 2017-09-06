class View {
  constructor(game, $el) {
    this.game = game;
    this.setupBoard.bind($el)();
    this.from = "";
    this.to = "";
    this.render();
    this.bindEvents();
  }

  bindEvents() {
    $('ul').on("click", event => {
      const $tower = $(event.currentTarget);
      this.clickTower($tower.data("tower"));
    });
  }

  clickTower(tower) {
    if (this.from === ""){
      this.from = tower;
      $('ul').eq(tower).removeClass('unselected');
      $('ul').eq(tower).addClass('selected');
    }else if(this.from !== ""){
      this.to = tower;
      this.makeMove(this.from, this.to);
      $('ul').eq(this.from).removeClass('selected');
      $('ul').eq(this.from).addClass('unselected');
      this.from = "";
      this.to = "";
    }
  }

  makeMove(from, to) {
    if (!this.game.move(from, to)) {
      alert("Invalid Move");
    }
    this.render();
    if (this.game.isWon()) {
      setTimeout(() => {
        alert("Winner winner chicken dinner");
        location.reload();
      }, 25);
    }
  }

  setupBoard() {
    for (let i = 0; i < 3; i++) {
      const $ul = $('<ul class="unselected"></ul>');
      $ul.data("tower", i);
      for (let j = 0; j < 3; j++) {
        const $li = $(`<li class></li>`);
        $ul.append($li);
      }
      this.append($ul);
    }
  }

  render(){
    $('li').removeAttr('class');
    this.game.towers.forEach( (row, i) => {
      const $ul = $('ul').eq(i);
      row.forEach( (disk, j) => {
        const $disk = $ul.find('li').eq(j);
        $disk.addClass(`disk-${disk}`);
      });
    });
  }
}

module.exports = View;
