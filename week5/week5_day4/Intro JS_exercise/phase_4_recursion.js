function range(start, end) {
  if (start === end ) {
    return [start];
  }
  return [start].concat(range(start + 1, end));
}

function range2(start, end) {
  if (start === end ) {
    return [start];
  }
  let res = range(start, end-1);
  res.push(end);
  return res;
}

function sumRec(arr) {
  if (arr.length === 1) {
    return arr[0];
  }
  let sum = 0;
  sum += arr[0] + sumRec(arr.slice(1,arr.length));
  return sum;
}

function exponent(base, exp) {
  if (exp === 0) {
    return 1;
  }
  return base * exponent(base, exp-1);
}

function exponent2(base, exp) {
  if (exp === 0) {
    return 1;
  }
if (exp === 1) {
  return base;
  }
  if (exp % 2 === 0 ) {
    return Math.pow(exponent2(base, exp/2),2);
  }
  else {
    return base * Math.pow(exponent2(base, (exp-1)/2), 2);
  }
}

function fibonacci(n) {
  if (n === 2) {
    return [0,1];
  }
  else if (n === 1) {
    return [0];
  }
  let res = fibonacci(n-1);
  return res.concat(res[res.length - 1] + res[res.length - 2]);

}

function bsearch(arr, target) {
  let mid = Math.floor(arr.length/2);
  if (arr[mid] === target) {
    return mid;
  } else if (target > arr[mid]) {
    let index = bsearch(arr.slice(mid+1,arr.length), target);
    return (index < 0) ? -1 :(mid + 1 + index);
  } else if (target < arr[mid]) {
    return bsearch(arr.slice(0, mid), target);
  } else {
    return -1;
  }
}

// console.log(bsearch([1,2,3,4,5], 1));
// console.log(bsearch([1,2,3,4,5], 2));
// console.log(bsearch([1,2,3,4,5], 4));
// console.log(bsearch([1,2,3,4,5], 5));
// console.log(bsearch([1,2,3,4,5], 8));

function mergesort(arr) {
  if (arr.length == 1) return arr;
  let mid = Math.floor(arr.length/2);
  let merge_left = mergesort(arr.slice(0, mid));
  let merge_right = mergesort(arr.slice(mid, arr.length));
  return merge(merge_left, merge_right);
}

function merge(left, right) {
  let res = [];
  while( left.length > 0 && right.length > 0) {
    if (left[0] > right[0]) {
      res.push(right.shift());
    } else {
      res.push(left.shift());
    }
  }
  res = res.concat(left);
  res = res.concat(right);
  return res;
}

// console.log(mergesort([6,2,4,0,1]));

function subsets(arr) {
  if (arr.length <= 0) return [[]];
  let sub = subsets(arr.slice(0, arr.length-1));
  return sub.concat(
    sub.map( el => el.concat(arr[arr.length-1]))
  );
}
// subsets([1,2,3,4]);
// subsets([1,2,3,4]) => [[], [1], [2], [1,2], [3], [1,3], [2,3], [1,2,3], ...]
// subsets([1,2,3]) => [[], [1], [2], [1,2], [3], [1,3], [2,3], [1,2,3]]
// subsets([1,2]) => [[], [1], [2], [1,2]]
// subsets([1]) => [[], [1]]
// subsets([]) => [[]]
