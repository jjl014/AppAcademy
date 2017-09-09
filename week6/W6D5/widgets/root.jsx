import React from 'react';
import Clock from './frontend/clock';
import Weather from './frontend/weather';
import AutoComplete from './frontend/autocomplete';

class Root extends React.Component {

  constructor() {
    super();
  }

  render() {
    return (
        <div className="root">
          <h1>Clock</h1>
          <Clock />
          <h1>Weather</h1>
          <Weather />
          <h1>Auto Complete</h1>
          <AutoComplete />
        </div>
    );
  }

}

export default Root;
