import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

mixin Helper {
  static List<LatLng> getNeSw(List<LatLng> list) {
    var lessLat = 1000.0;
    var maxLat = -1000.0;
    var lessLng = 1000.0;
    var maxLng = -1000.0;

    for (var data in list) {
      if (lessLat > data.latitude) {
        lessLat = data.latitude;
      }
      if (maxLat < data.latitude) {
        maxLat = data.latitude;
      }
      if (lessLng > data.longitude) {
        lessLng = data.longitude;
      }
      if (maxLng < data.longitude) {
        maxLng = data.longitude;
      }
    }
    var dlat = maxLat - lessLat;
    var dlng = maxLng - lessLng;

    if (dlat > dlng) {
      var homuch = dlat - dlng;
      maxLng += homuch / 2;
      lessLng -= homuch / 2;
    } else {
      var homuch = dlng - dlat;
      maxLat += homuch / 2;
      lessLat -= homuch / 2;
    }

    return [
      LatLng(maxLat, maxLng),
      LatLng(lessLat, lessLng),
    ];
  }
}