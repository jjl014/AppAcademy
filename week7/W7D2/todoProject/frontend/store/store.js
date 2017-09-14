import { createStore, applyMiddleware } from 'redux';
import RootReducer from '../reducers/root_reducer';
import thunk from '../middlewares/thunk';
import logger from 'redux-logger';

const configureStore = () => {
  const store = createStore(RootReducer, applyMiddleware(thunk, logger));
  return store;
};

export default configureStore;
