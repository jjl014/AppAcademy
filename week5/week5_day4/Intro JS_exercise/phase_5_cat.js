function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function cuteStatement() {
  return `${this.owner} loves ${this.name}`;
};

let cat1 = new Cat('kitty', 'Jimmy');
let cat2 = new Cat('dog', 'Priya');

console.log(cat1.cuteStatement());
console.log(cat2.cuteStatement());

Cat.prototype.cuteStatement = function cuteStatement() {
  return `Everybody loves ${this.name}`;
};

console.log(cat1.cuteStatement());
console.log(cat2.cuteStatement());

Cat.prototype.meow = function meow() {
  return 'meow';
};

console.log(cat1.meow());
console.log(cat2.meow());

cat1.meow = function () {
  return 'woooof';
};
console.log(cat1.meow());
console.log(cat2.meow());
