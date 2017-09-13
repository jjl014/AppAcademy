import React from 'react';
import merge from 'lodash/merge';
import TodoDetailViewContainer from './todo_detail_view_container';


class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    // this.clickedButton = this.clickedButton.bind(this);
    this.clickDone = this.clickDone.bind(this);
    this.clickShow = this.clickShow.bind(this);
    this.state = {detail: false};
  }

  // clickedButton(e) {
  //   e.preventDefault();
  //   this.props.removeTodo(this.props.item);
  // }
  //
  clickShow(e) {
    e.preventDefault();
    this.setState({detail: !this.state.detail});
  }

  clickDone(e) {
    e.preventDefault();
    const {item} = this.props;
    const {done} = item;
    const newItem = merge({}, item, {done: !item.done});
    this.props.receiveTodo(newItem);
  }

  render() {
    const item = this.props.item;
    let detail;
    if (this.state.detail) {
      detail = <TodoDetailViewContainer item={item} />;
    }
    return (
      <div>
        <li onClick={this.clickShow}>{item.title}</li>
        <button onClick={this.clickDone}>{item.done ? 'Undo' : 'Done'}</button>
        {detail}
      </div>
    );
  }
}

export default TodoListItem;
