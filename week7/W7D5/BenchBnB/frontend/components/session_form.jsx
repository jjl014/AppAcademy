import React from 'react';
import { Link } from 'react-router-dom';

export default class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };
    this.submit = this.submit.bind(this);
  }

  update(field) {
    return (e) => {
      this.setState({[field]: e.target.value});
    };
  }

  submit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user, this.props.formType);
  }

  renderErrors() {
    return (
      <ul>
        {
          this.props.errors.map((error, i) => (
            <li key={`error-${i}`}>{error}</li>
          ))
        }
      </ul>
    );
  }

  render() {
    let { formType } = this.props;
    let header, buttonName, link;

    if (formType === 'login') {
      header = (<h1>Log In</h1>);
      buttonName = 'Log In';
      link = (<Link to='/signup'>Sign Up</Link>);
    } else {
      header = (<h1>Sign Up</h1>);
      buttonName = 'Sign Up';
      link = (<Link to='/login'>Log In</Link>);
    }

    return (
      <div>
        { header }
        { link }
        { this.renderErrors() }
        <form className="session-form">
          <input type="text"
                 onChange={this.update("username")}
                 value={this.state.username}>
          </input>
          <input type="password"
                 onChange={this.update("password")}
                 value={this.state.password}>
          </input>
          <button onClick={this.submit}>{buttonName}</button>
        </form>
      </div>
    );
  }
}
