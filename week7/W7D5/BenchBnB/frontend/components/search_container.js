import {connect} from 'react-redux';
import Search from './search';
import {getBenches} from '../actions/bench_actions';
import {updateFilter} from '../actions/filter_actions';

const mapStateToProps = (state) => ({
  benches: state.entities.benches
});

const mapDispatchToProps = (dispatch) => ({
  getBenches: (filter) => dispatch(getBenches(filter)),
  updateFilter: (filter, value) => dispatch(updateFilter(filter, value))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Search);
