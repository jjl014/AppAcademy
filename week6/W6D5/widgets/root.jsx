import React from 'react';
import Clock from './frontend/clock';
import Weather from './frontend/weather';

class Root extends React.Component {

  constructor() {
    super();
  }

  render() {
    return (
        <div>
          <h1>Clock Widget</h1>
          <Clock />
          <h1>Weather Widget</h1>
          <Weather />
        </div>
    );
  }

}

export default Root;
