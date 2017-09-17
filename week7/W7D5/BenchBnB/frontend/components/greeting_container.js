import Greeting from './greeting';
import { connect } from 'react-redux';
import { signout } from '../actions/session_actions';

const mapStateToProps = state => ({
  currentUser: state.session.currentUser
});

const mapDispatchToProps = dispatch => ({
  signoff: () => dispatch(signout())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Greeting);
