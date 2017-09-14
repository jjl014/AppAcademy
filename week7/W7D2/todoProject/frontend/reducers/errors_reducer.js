import {RECEIVE_ERRORS, CLEAR_ERRORS} from '../actions/error_actions';
import merge from 'lodash/merge';
import {RECEIVE_TODOS} from '../actions/todo_actions';

const errorsReducer = (state = [], action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_ERRORS:
      return action.errors;
    case CLEAR_ERRORS:
      return [];
    // case RECEIVE_TODOS:
    //   return [];
    default:
      return state;
  }
};

export default errorsReducer;
