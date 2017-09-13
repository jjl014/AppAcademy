import {connect} from 'react-redux';
import TodoDetailView from './todo_detail_view';
import { removeTodo} from '../../actions/todo_actions';
import {receiveSteps} from '../../actions/step_actions';

const mapDispatchToProps = dispatch => ({
  removeTodo: (todo) => dispatch(removeTodo(todo)),
  receiveSteps: (step) => dispatch(receiveSteps(step))
});

const mapStateToProps = (state, {item}) => ({
  item: item
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoDetailView);
