import React from 'react';
import ReactDOM from 'react-dom';
import Root from './frontend/components/root';
import configureStore from './frontend/store/store';
import { receiveTodo, receiveTodos} from './frontend/actions/todo_actions';
import { allTodos, stepsByTodoId } from './frontend/reducers/selectors';

// window.store = configureStore();
window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;
window.allTodos = allTodos;
window.stepsByTodoId = stepsByTodoId;

document.addEventListener("DOMContentLoaded", event => {
  const root = document.getElementById('root');
  const store = configureStore();
  window.store = store;
  ReactDOM.render(<Root store={store}/>, root);
});
