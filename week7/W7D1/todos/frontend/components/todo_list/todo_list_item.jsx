import React from 'react';

const TodoListItem = ({item}) => (
  <li>{item.title} => {item.body}</li>
);

export default TodoListItem;
