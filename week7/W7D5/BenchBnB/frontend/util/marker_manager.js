export default class MarkerManager {
  constructor(map) {
    this.map = map;
    this.markers = {};
  }

  updateMarkers(benches) {
    Object.keys(benches).forEach(benchId => {
      if(!this.markers[benchId]) {
        const bench = benches[benchId];
        this.createMarkerFromBench(bench);
      }
    });
    for(let key in this.markers) {
      if (!benches[key]) {
        this.removeMarker(this.markers[key]);
      }
    }
  }

  createMarkerFromBench(bench){
    const latlng = new google.maps.LatLng(bench.lat, bench.lng);
    const marker = new google.maps. Marker({
      position: latlng,
      title: bench.description,
      benchId: bench.id
    });
    this.markers[marker.benchId] = marker;
    marker.setMap(this.map);
  }

  removeMarker(marker) {
    this.markers[marker.benchId].setMap(null);
    delete this.markers[marker.benchId];
  }
}
