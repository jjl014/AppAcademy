Array.prototype.bubbleSort = function bubbleSort() {
  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this.length - i; j++) {
      if (this[j ] > this[j+1]) {
        var temp = this[j+1];
        this[j+1] = this[j];
        this[j] = temp;
      }
    }
  }
  return this;
};

String.prototype.substrings = function substrings() {
  let res = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i+1; j <= this.length; j++) {
      res.push(this.slice(i, j));
    }
  }
  return res;
};
