import React from 'react';
import { withRouter } from 'react-router-dom';
import MarkerManager from '../util/marker_manager';

class BenchMap extends React.Component {
  constructor(props) {
    super(props);
    this.updateMap = this.updateMap.bind(this);
  }

  componentDidMount() {
    const mapOptions = {
      center: {lat: 37.7758, lng: -122.435 },
      zoom: 13
    };
    const map = this.refs.map;
    this.map = new google.maps.Map(map, mapOptions);
    this.MarkerManager = new MarkerManager(this.map);
    this.MarkerManager.updateMarkers(this.props.benches);
    google.maps.event.addListener(
      this.map,
      'idle',
      () => this.updateMap(this.map.getBounds())
    );
    google.maps.event.addListener(
      this.map,
      'click',
      (e) => this._handleClick(e.latLng)
    );
  }

  _handleClick(coords) {
    const lat = coords.lat();
    const lng = coords.lng();
    this.props.history.push({
      pathname: "benches/new",
      search: `lat=${lat}&lng=${lng}`
    });

  }

  updateMap(bounds) {
    const ne = bounds.getNorthEast();
    const sw = bounds.getSouthWest();
    const value = {
      northEast: {lat: ne.lat(), lng: ne.lng()},
      southWest: {lat: sw.lat(), lng: sw.lng()}
    };
    this.props.updateFilter('bounds', value);
  }

  componentDidUpdate() {
    this.MarkerManager.updateMarkers(this.props.benches);
  }

  render() {
    return (
      <div id="map-container" ref="map"></div>
    );
  }
}

export default withRouter(BenchMap);
