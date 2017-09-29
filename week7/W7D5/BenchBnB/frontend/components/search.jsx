import React from 'react';
import BenchMap from './bench_map';
import BenchIndex from './bench_index';

const Search = ({benches, getBenches, updateFilter}) => (
  <div className="search-map-index">
    <BenchIndex benches={benches} />
    <BenchMap benches={benches} getBenches={getBenches} updateFilter={updateFilter}/>
  </div>
);

export default Search;
