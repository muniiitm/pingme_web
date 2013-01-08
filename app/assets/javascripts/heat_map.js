var map, heatmap, data;
var nextLocation = 0;    
var running = false;
var unlock = false;

var asso_loc = "";
function initialize(location_data) {  
  asso_loc = location_data;  
  
  data = new google.maps.MVCArray();
  
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 5,
    center: new google.maps.LatLng(18.312810846425442, 78.046875),
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    styles: [{
      stylers: [{saturation: -100}]
    }, {
      featureType: 'poi.park',
      stylers: [{visibility: 'on'}]
    }],
    // mapTypeId: google.maps.MapTypeId.SATELLITE,
    disableDefaultUI: false
  });

  heatmap = new google.maps.visualization.HeatmapLayer({
    map: map,
    data: data,
    radius: 16,
    dissipate: true,
    maxIntensity: 5   
  });

  // google.maps.event.addListener(map, 'mouseout', stop);
  google.maps.event.addListener(map, 'tilesloaded', function() {
    unlock = true;
  });
}

function start() {  
    document.getElementById("lightbox").style.display = "none";        
    running = true;
    nextLoc();  
}   

function nextLoc() {
  if (! running) {
    return;
  }      
  while (asso_loc.length > nextLocation) {    
    data.push(new google.maps.LatLng(asso_loc[nextLocation].coords[0], asso_loc[nextLocation].coords[1]));
    nextLocation++;
  }
  if (nextLocation < asso_loc.length) {
    setTimeout(nextLoc, 30);
  }
}