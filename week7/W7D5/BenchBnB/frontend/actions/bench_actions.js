export const RECEIVE_BENCHES = "RECEIVE_BENCHES";
export const RECEIVE_BENCH = "RECEIVE_BENCH";
import {fetchBenches, postBench} from '../util/bench_api_util';

export const receiveBenches = (benches) => ({
  type: RECEIVE_BENCHES,
  benches
});

export const receiveBench = bench => ({
  type: RECEIVE_BENCH,
  bench
});

export const getBenches = (filters) => dispatch => {
  return fetchBenches(filters)
         .then((benches) => dispatch(receiveBenches(benches)));
};

export const createBench = bench => dispatch => {
  return postBench(bench)
         .then((newBench) => dispatch(receiveBench(newBench)));
};
