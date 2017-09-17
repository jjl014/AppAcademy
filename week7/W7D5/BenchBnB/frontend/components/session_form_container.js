import { connect } from 'react-redux';
import SessionForm from './session_form';
import { signin, register } from '../actions/session_actions';
import { withRouter } from 'react-router-dom';

const mapStateToProps = (state, ownProps) => ({
  loggedIn: Boolean(state.currentUser),
  errors: state.errors.session,
  formType: ownProps.location.pathname === '/login' ? 'login' : 'logout'

});

const mapDispatchToProps = (dispatch, ownProps) => ({
  processForm: (user, formType) => {
    if (formType === 'login') {
      return dispatch(signin(user));
    } else {
      return dispatch(register(user));
    }
  }
});

export default withRouter(
  connect(
    mapStateToProps,
    mapDispatchToProps
  )(SessionForm)
);
