export const allTodos = (state) => {
  console.log("hey");
  return Object.keys(state.todos).map(key => {
    return state.todos[key];
  });
};
