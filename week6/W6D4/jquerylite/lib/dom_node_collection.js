class DOMNodeCollection {
  constructor(HTMLElements){
    this.HTMLElements = HTMLElements;
  }

  html(string){
    if (!string){
      return this.HTMLElements[0].innerHTML;
    } else {
      this.HTMLElements[0].innerHTML = string;
    }
  }

  empty(){
    this.HTMLElements.forEach((el) => {
      el.innerHTML = "";
    });
  }

  append(arg){
    this.HTMLElements.forEach((htmlEl) => {
      if (typeof arg === 'string') {
        htmlEl.innerHTML += arg;
      } else if (arg instanceof HTMLElement){
        htmlEl.innerHTML += arg.outerHTML;
      } else {
        arg.forEach( el => {
          htmlEl.innerHTML += el.outerHTML;
        });
      }
    });
  }

  attr(name, value){
    if (!value){
      return this.HTMLElements[0].attributes[name];
    } else {
      this.HTMLElements[0].attributes[name] = value;
    }
  }

  addClass(className){
    let classes = this.HTMLElements[0].className.split(" ");
    classes.push(className);
    this.HTMLElements[0].className = classes.join(" ");
  }

  removeClass(className) {
    let classes = this.HTMLElements[0].className.split(" ");
    classes.splice(classes.indexOf(className), 1);
    this.HTMLElements[0].className = classes.join(" ");
  }

  children() {
    let nodeChildren = [];
    this.HTMLElements.forEach((el) => {
      if (el.children.length > 0){
        nodeChildren = nodeChildren.concat(el.children);
      }
    });
    return new DOMNodeCollection(nodeChildren);
  }

  parent(){
    let nodeParents = [];
    this.HTMLElements.forEach((el) => {
      if (!nodeParents.includes(el.parentNode)){
        nodeParents = nodeParents.concat(el.parentNode);
      }
    });
    return new DOMNodeCollection(nodeParents);
  }

  find(selector){
    let found = [];
    this.HTMLElements.forEach((el) => {
      if (el.querySelectorAll(selector).length > 0){
        found = found.concat(el.querySelectorAll(selector));
      }
    });
    return new DOMNodeCollection(found);
  }

  remove(){
    this.HTMLElements.forEach(node => node.parentNode.removeChild(node));
  }

  on(event, method){
    this.HTMLElements.forEach((el) => {
      el.addEventListener(event, method);
    });
  }

  off(){
    
  }
}


module.exports = DOMNodeCollection;
