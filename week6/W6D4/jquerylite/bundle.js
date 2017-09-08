/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const DOMNodeCollection = __webpack_require__(1);

window.$l = function(arg){
  if (typeof arg === 'string'){
    let collection = document.querySelectorAll(arg);
    return new DOMNodeCollection(Array.from(collection));
  } else if (arg instanceof HTMLElement){
    return new DOMNodeCollection([arg]);
  }
};


/***/ }),
/* 1 */
/***/ (function(module, exports) {

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


/***/ })
/******/ ]);