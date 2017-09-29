import React from 'react';
import BenchIndexItem from './bench_index_item';

export default class BenchIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    let { benches } = this.props;
    benches = Object.values(benches).map( bench => {
      return <BenchIndexItem key={bench.id} bench={bench}/>;
    });
    return(
      <div>
        <ul>
          {benches}
        </ul>
      </div>
    );
  }
}
