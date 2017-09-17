import {connect} from 'react-redux';
import {withRouter, Route, Redirect} from 'react-router-dom';
import React from 'react';

const Auth = ({component: Component, path, loggedIn}) => (
  <Route path={path} render={(props) => (
      !loggedIn? (
        <Component {...props} />
      ) : (
        <Redirect to='/'/>
      )
    )}/>
);

const Protected = ({component: Component, path, loggedIn}) => (
  <Route path={path} render={(props) => (
      loggedIn? (
        <Component {...props} />
      ) : (
        <Redirect to='/' />
      )
    )}/>
);

const mapStateToProps = state => ({
  loggedIn: Boolean(state.session.currentUser)
});

export const ProtectedRoute = withRouter(connect(mapStateToProps, undefined)(Protected));
export const AuthRoute = withRouter(connect(mapStateToProps, undefined)(Auth));
