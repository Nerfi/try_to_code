import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

// importing the yarn package to search on the map
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import places from 'places.js';
initMapbox();
