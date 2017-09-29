import React from 'react';

export default class BenchForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      description: "",
      lng: this.props.lat,
      lat: this.props.lng,
      seats: 0
    };
  }

  _handleChange(field) {
    return (e) => this.setState({ [field]: e.target.value });
  }

  handleSubmit() {
    return (e) => (
      this.props.createBench(this.state)
    );
  }

  render() {
    console.log(this.state);
    return (
      <div>
        <form className="bench-form">
          <label>Description
            <input onChange={this._handleChange('description')} type="text" value={this.state.description}></input>
          </label>
          <label>Number of seats
            <input onChange={this._handleChange('seats')} type="number" min="1" max="10" value={this.state.seats}></input>
          </label>
          <label>Latitude
            <input type="text" value={this.state.lat} disabled></input>
          </label>
          <label>Longitude
            <input type="text" value={this.state.lng} disabled></input>
          </label>
          <submit onClick={this.handleSubmit()}>Create New Bench</submit>
        </form>
      </div>
    );
  }
}
