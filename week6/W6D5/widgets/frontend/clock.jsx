import React from 'react';
import Util from '../lib/util';

class Clock extends React.Component {
  constructor() {
    super();

    this.state = { time: new Date() };
    // this.tick = this.tick.bind(this);
  }

  tick() {

    return () => {
      this.setState({ time: new Date() });
    };
  }

  render() {
    const time = this.state.time;
    const hours = Util.addZero(time.getHours());
    const minutes = Util.addZero(time.getMinutes());
    const seconds = Util.addZero(time.getSeconds());

    const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    const days = ["Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat"];

    const day = days[time.getDay()];
    const date = time.getDate();

    const month = months[time.getMonth()];
    const year = time.getFullYear();

    return (
      <div className="clock">
        <div className="row">
          <h2 className="timeformat" >Time:</h2>
          <h2 className="timeformat" >{hours}:{minutes}:{seconds} PDT</h2>
        </div>
        <div className="row">
          <h2 className="timeformat" >Date:</h2>
          <h2 className="timeformat" >{day} {month} {date} {year}</h2>
        </div>
      </div>
    );
  }

  componentDidMount() {
    this.id = setInterval(this.tick(), 1000);

  }

  componentWillUnmount() {
    clearInterval(this.id);
  }


}

export default Clock;
