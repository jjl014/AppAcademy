import React from 'react';
import ReactDOM from 'react-dom';
import Root from './root';


document.addEventListener('DOMContentLoaded', event => {
  ReactDOM.render(<Root />, document.getElementById('main'))
});

window.Root = Root;
