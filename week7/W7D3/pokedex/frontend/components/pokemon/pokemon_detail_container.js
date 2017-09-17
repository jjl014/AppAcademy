import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail';
import { selectPokemonById } from '../../reducers/selectors';
import {fetchPokemon} from '../../actions/pokemon_actions';

const mapStateToProps = state => ({
  pokemon: selectPokemonById(state)
});

const mapDispatchToProps = dispatch => ({
  fetchPokemon: (pokemonId) => dispatch(fetchPokemon(pokemonId))
});


export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
