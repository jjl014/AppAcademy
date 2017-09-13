export const allTodos = (state) => {
  return Object.keys(state.todos).map(key => {
    return state.todos[key];
  });
};

export const stepsByTodoId = (state, todoId) => {
  const {steps} = state;
  const stepsWithTodoId = [];
  Object.keys(steps).forEach(stepId => {
    // debugger;
    if (steps[stepId].todoId === todoId) {
      stepsWithTodoId.push(steps[stepId]);
    }
  });
  return stepsWithTodoId;
};
