import React from 'react';
import ToDoListItem from './todo_list_item';
import TodoForm from './todo_form';

const TodoList = ({todos, receiveTodo, removeTodo}) => (
  <div>
    <ul>
      {
        todos.map((item) => (
          <ToDoListItem key={item.id}
                        item={item}
                        removeTodo={removeTodo}
                        receiveTodo={receiveTodo}/>
        ))
      }
    </ul>
    <TodoForm receiveTodo={receiveTodo}/>
  </div>
);

export default TodoList;
