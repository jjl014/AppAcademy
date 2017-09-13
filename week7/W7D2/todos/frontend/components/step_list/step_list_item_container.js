import { connect } from 'react-redux';
import StepListItem from './step_list_item';
// Actions
import { receiveStep, removeStep } from '../../actions/step_actions';

const mapDispatchToProps = (dispatch, { step }) => ({
  removeStep: () => dispatch(removeStep(step)),
  receiveStep: (newStep) => dispatch(receiveStep(newStep))
});

const mapStateToProps = (state, {item}) => ({
  item: item
});

export default connect(
  mapStateToProps, // step prop is already passed in
  mapDispatchToProps
)(StepListItem);
