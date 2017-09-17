import {signup, login, logout} from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const RECEIVE_SESSION_ERRORS = "RECEIVE_SESSION_ERRORS";

export const receiveSessionErrors = (errors) => ({
  type: RECEIVE_SESSION_ERRORS,
  errors
});

export const receiveCurrentUser = (user) => {
  return {
    type: RECEIVE_CURRENT_USER,
    user
  };
};

export const signin = user => dispatch => {
  return login(user).then((userData) => {
    return dispatch(receiveCurrentUser(userData));
  },
  (error) => {
    return dispatch(receiveSessionErrors(error.responseJSON));
  });
};

export const register = (user) => dispatch => (
  signup(user).then((userData) => dispatch(receiveCurrentUser(userData)),
                    (error) => dispatch(receiveSessionErrors(error.responseJSON))
  )
);

export const signout = () => dispatch => (
  logout().then(() => dispatch(receiveCurrentUser(null)))
);
