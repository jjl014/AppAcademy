import ErrorsReducer from './errors_reducer';
import SessionReducer from './session_reducer';
import {combineReducers} from 'redux';

const RootReducer = combineReducers({
  errors: ErrorsReducer,
  session: SessionReducer
});

export default RootReducer;
