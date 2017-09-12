import merge from 'lodash/merge';
import {RECEIVE_TODO, RECEIVE_TODOS} from '../actions/todo_actions';

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  let newState;
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_TODOS:
      newState = merge({}, state);
      for (let todoIdx in action.todos) {
        let todo = action.todos[todoIdx];
        newState[todo.id] = todo;
      }
      return newState;
    case RECEIVE_TODO:
      // debugger;
      newState = merge({}, state);
      newState[action.todo.id] = action.todo;
      return newState;
    default:
      return state;
  }
};

export default todosReducer;
