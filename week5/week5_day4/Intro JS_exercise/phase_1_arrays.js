Array.prototype.uniq = function uniq() {
  let arr = [];
  this.forEach( el => {
    if (!arr.includes(el)) {
      arr.push(el);
    }
  });
  return arr;
};

Array.prototype.twoSum = function twoSum() {
  let arr = [];
  for( let i = 0; i < this.length - 1; i++) {
    let first = this[i];
    for( let j = i + 1; j < this.length; j++) {
      if (first + this[j] === 0) {
        arr.push([i,j]);
      }
    }
  }
  return arr;
};

Array.prototype.transpose = function transpose() {
  let arr = [];
  for (let i = 0; i < this.length; i++) {
    let temp = [];
    for (let j = 0; j < this[0].length; j++) {
      temp.push(this[j][i]);
    }
    arr.push(temp);
  }
  return arr;
};

Array.prototype.transpose2 = function transpose() {
  let arr = [];
  for (let i = 0; i < this[0].length; i++ ) {
    arr.push([]);
  }
};

function Create2dArray(row, col) {
  let new_arr = new Array(row);

}
