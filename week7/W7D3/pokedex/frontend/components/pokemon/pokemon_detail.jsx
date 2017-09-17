import React from 'react';
import { Link } from 'react-router-dom';

export default class PokemonDetail extends React.Component {

  componentDidMount() {
    this.props.fetchPokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps(newProps) {
    // console.log(this.props);
    if (this.props.match.params.pokemonId !== newProps.match.params.pokemonId) {
      this.props.fetchPokemon(newProps.match.params.pokemonId);
    }
  }

  render(){
    const {pokemon} = this.props;
    if (!pokemon) return null;

    return (
       <div className="poke-detail">
         <img src={pokemon.image_url} />
         <li className="poke-detail-li">Id: {pokemon.id}</li>
         <li className="poke-detail-li">Name: {pokemon.name}</li>
         <li className="poke-detail-li">Attack: {pokemon.attack}</li>
         <li className="poke-detail-li">Defense: {pokemon.defense}</li>
         <li className="poke-detail-li">Type: {pokemon.poke_type[0].toUpperCase()+pokemon.poke_type.slice(1)}</li>
       </div>
   );
  }

}
