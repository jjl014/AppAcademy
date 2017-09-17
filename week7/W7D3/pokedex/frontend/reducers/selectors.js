export const selectAllPokemon = state => (
  Object.values(state.entities.pokemon)
);

export const selectPokemonById = (state) => {
  return state.entities.pokemon[state.ui.pokeDisplay];
};
