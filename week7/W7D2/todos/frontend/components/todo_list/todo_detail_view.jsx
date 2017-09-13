import React from 'react';

import StepListContainer from '../step_list/step_list_container';

class TodoDetailView extends React.Component{
  constructor(props) {
    super(props);
    this.clickedRemove = this.clickedRemove.bind(this);
  }

  clickedRemove(e) {
    e.preventDefault();
    console.log(this.props);
    this.props.removeTodo(this.props.item);
  }

  render() {
    const item = this.props.item;

    return (
      <div>
        <p>{item.body}</p>
        <StepListContainer todo_id={ item.id } />
        <button onClick={this.clickedRemove}>remove</button>
      </div>
    );
  }
}

export default TodoDetailView;
