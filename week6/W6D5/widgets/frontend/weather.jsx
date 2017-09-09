import React from 'react';

class Weather extends React.Component {

  constructor() {
    super();
    this.state = {name: "", temp: "", high: "", low: "", humidity: "", condition: "", wind: ""};
    this.getWeather = this.getWeather.bind(this);
  }

  componentDidMount() {
    this.getGeoLocation();
  }

  getGeoLocation() {
    navigator.geolocation.getCurrentPosition(this.getWeather);
  }

  getWeather(position) {
    const req = new XMLHttpRequest();
    const lat = position.coords.latitude;
    const lon = position.coords.longitude;
    const url = `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=1c1d7750a2eacc9319911f908e3a1034
`;
    req.open("GET", url, true);
    req.onload = () => {
      if (req.status >= 200 && req.status < 400) {
        const {weather, wind, name, main} = JSON.parse(req.responseText);
        this.setState({
          name,
          temp: main.temp,
          high: main.temp_max,
          low: main.temp_min,
          humidity: main.humidity,
          condition: weather[0].main,
          wind: wind.speed
        });
      } else {
        alert('Error occured');
      }
    };
    req.send();
  }

  render() {
    let content = <div></div>;
    if(this.state.name) {
      content = <div className="weather">
        <div className="row">
          <h2>Location</h2>
          <h2>{this.state.name}</h2>
        </div>
        <div className="row">
          <h2>Temperature</h2>
          <h2>{this.state.temp}</h2>
        </div>
        <div className="row-right">
          <h3>High: {this.state.high}</h3>
          <h3>Low: {this.state.low}</h3>
        </div>
        <div className="row">
          <h2>Wind</h2>
          <h2>{this.state.wind} MPH</h2>
        </div>
        <div className="row">
          <h2>Condition</h2>
          <h2>{this.state.condition}y</h2>
        </div>
      </div>;
    } else {
      content = <div className="weather">
        <h2>Loading Weather...</h2>
      </div>;
    }
    return (
      <div>
        {
          content
        }
      </div>

    );
  }
}
window.Weather = Weather;

export default Weather;
