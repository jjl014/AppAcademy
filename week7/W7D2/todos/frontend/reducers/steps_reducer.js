import merge from 'lodash/merge';
import {REMOVE_STEP, RECEIVE_STEP, RECEIVE_STEPS} from '../actions/step_actions';

const initialState = {
  1: {
    id: 1,
    title: "walk cat",
    body: "around the block",
    done: false,
    todoId: 2
  },
  2: {
    id: 2,
    title: "vacuum",
    body: "the bathroom",
    done: false,
    todoId: 1
  }
};

const stepsReducer = (state = initialState, action) => {
  let newState;
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_STEPS:
      newState = merge({}, state);
      action.steps.forEach((step) => {newState[step.id] = step;});
      return newState;
    case RECEIVE_STEP:
      newState = merge({}, state);
      newState[action.step.id] = action.step;
      return newState;
    case REMOVE_STEP:
      newState = merge({}, state);
      delete newState[action.step.id];
      return newState;
    default:
      return state;
  }
};

export default stepsReducer;
