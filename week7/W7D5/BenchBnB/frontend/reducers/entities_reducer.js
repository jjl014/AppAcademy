import { combineReducers } from 'redux';
import BenchesReducer from './benches_reducer';

const EntitiesReducer = combineReducers({
  benches: BenchesReducer
});

export default EntitiesReducer;
