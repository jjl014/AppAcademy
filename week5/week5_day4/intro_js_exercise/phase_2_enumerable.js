Array.prototype.myEach = function myEach(cb) {
  // let result = [];
  for(let i = 0; i < this.length; i++) {
    cb(this[i]);
  }
};


Array.prototype.myMap = function myMao(cb) {
  let result = [];

  this.myEach( el => {
    result.push(cb(el));
  });
  return result;
};

Array.prototype.myReduce = function myReduce(cb, initial) {
  let acc = initial || this.shift();

  this.myEach( el => {
    acc = cb(acc, el);
  });
  return acc;
};
