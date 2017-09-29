import { getBenches } from './bench_actions';

export const UPDATE_FILTER = "UPDATE_BOUNDS";

export const changeFilter = (filter, value) => ({
  type: UPDATE_FILTER,
  filter,
  value
});

export const updateFilter = (filter, value) => (dispatch, getState) => {
  dispatch(changeFilter(filter, value));
  return getBenches(getState().ui.filters)(dispatch);
};
