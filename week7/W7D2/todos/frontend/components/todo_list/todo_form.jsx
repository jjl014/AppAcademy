import React from 'react';
import Util from '../../util/util';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {id: null, title: "", body:"", done: false};
    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
    this.submit = this.submit.bind(this);
  }

  updateTitle(e) {
    // console.log(`title: ${e.target.value}`);
    this.setState({
      title: e.target.value
    });
  }

  updateBody(e) {
    // console.log(`body: ${e.target.value}`);
    this.setState({
      body: e.target.value
    });
  }

  submit(e) {
    e.preventDefault();
    const todo = Object.assign({}, this.state, {id: Util.uniqueId()});
    this.props.receiveTodo(todo);
    // this.setState({id: Util.uniqueId()},
    //               () => this.props.receiveTodo(this.state));
    this.setState({title: "", body: ""});
  }

  render() {
    return (
    <div>
      <form onSubmit={this.submit}>
        <label>Title
          <input onChange={this.updateTitle} type="text" value={this.state.title}></input>
        </label>
        <label>Body
          <textarea onChange={this.updateBody} value={this.state.body}></textarea>
        </label>
        <button>Submit Todo</button>
      </form>
    </div>

    );
  }
}

export default TodoForm;
