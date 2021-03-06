const DOMNodeCollection = require('./dom_node_collection');

window.$l = function(arg){
  if (typeof arg === 'string'){
    let collection = document.querySelectorAll(arg);
    return new DOMNodeCollection(Array.from(collection));
  } else if (arg instanceof HTMLElement){
    return new DOMNodeCollection([arg]);
  }
};
