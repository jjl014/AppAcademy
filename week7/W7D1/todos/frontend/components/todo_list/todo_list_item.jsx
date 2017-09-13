import React from 'react';
import merge from 'lodash/merge';

class TodoListItem extends React.Component {
  constructor (props) {
    super(props);
    this.state = {done: false};
    this.removeTodo = this.removeTodo.bind(this);
    this.updateStatus = this.updateStatus.bind(this);
  }

  removeTodo(e) {
    e.preventDefault();
    const {item, removeTodo} = this.props;
    removeTodo(item);
  }

  updateStatus(e) {
    e.preventDefault();
    const {item, receiveTodo} = this.props;
    const updatedItem = merge({}, item, {done: !item.done});
    receiveTodo(updatedItem);
  }

  render() {
    const {item, removeTodo} = this.props;
    const {title, done} = item;
    return (
      <div>
        <li>{item.title} => {item.body}</li>
        <button onClick={this.removeTodo} value={item.id}>remove</button>
        <button onClick={this.updateStatus}>{done ? "Undo": "Done"}</button>
      </div>
    );
  }
}


export default TodoListItem;
