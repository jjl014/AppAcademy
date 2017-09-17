import React from 'react';
import { Route, Link } from 'react-router-dom';

export default class Greeting extends React.Component {
  constructor(props) {
    super(props);
    this.signout = this.signout.bind(this);
  }

  signout(e) {
    e.preventDefault();
    this.props.signoff();
  }

  render() {
    let display;
    let currentUser = this.props.currentUser;
    display = currentUser ?
      (
        <nav>
          <h1>Welcome, {currentUser.username}</h1>
          <button onClick={this.signout}>Log Out</button>
        </nav>
      ) : (
        <nav>
          <Link to='/signup'>Sign Up</Link>
          <Link to='/login'>Log In</Link>
        </nav>
      );
    return (
      <div>
        { display }
      </div>
    );
  }
}
