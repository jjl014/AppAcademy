import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import {getBenches} from './actions/bench_actions';
import {fetchBenches} from './util/bench_api_util';

document.addEventListener("DOMContentLoaded", event => {
  let store;
  if (window.currentUser) {
    const preloadedState = {
      session: { currentUser: window.currentUser }
    };
    store = configureStore(preloadedState);
    delete window.currentUser;
  } else {
    store = configureStore();
  }

  window.getState = store.getState;
  window.dispatch = store.dispatch;

  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, rootEl);
});

window.getBenches = getBenches;
window.fetchBenches = fetchBenches;
