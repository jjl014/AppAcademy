import * as TodoAPIUtil from '../util/todo_api_util';
import {receiveErrors, clearErrors} from './error_actions';

export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";
export const TODO_ERROR = "TODO_ERROR";

export const receiveTodos = todos => ({
  type: RECEIVE_TODOS,
  todos
});

export const receiveTodo = todo => ({
  type: RECEIVE_TODO,
  todo
});

export const removeTodo = todo => ({
  type: REMOVE_TODO,
  todo
});

export const fetchTodos = () => dispatch => (
  TodoAPIUtil.fetchTodos().then(res => dispatch(receiveTodos(res)))
             //.then(() => dispatch(clearErrors()))

);

export const createTodo = (todo) => dispatch => (
  TodoAPIUtil.createTodo(todo)
             .then(res => dispatch(receiveTodo(res)),
                   err => dispatch(receiveErrors(err.responseJSON)))
             .then(() => dispatch(clearErrors()))
);
