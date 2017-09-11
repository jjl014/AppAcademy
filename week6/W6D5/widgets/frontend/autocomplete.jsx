import React from 'react';

class AutoComplete extends React.Component {
  constructor(prop){
    super(prop);

  }

  render() {
    return (
      <div className="autocomplete">
        <input type="text"></input>
        <ul>
        </ul>
      </div>
    );
  }
}

export default AutoComplete;
