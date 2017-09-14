export const allTodos = ({ todos }) => Object.keys(todos).map(id => todos[id]);

export const stepsByTodoId = ({ steps }, todo_id) => {
  const stepsWithTodoId = [];
  Object.keys(steps).forEach(stepId => {
    const step = steps[stepId];
    if (steps[stepId].todo_id === todo_id) stepsWithTodoId.push(step);
  });
  return stepsWithTodoId;
};
