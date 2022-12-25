import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_trip_ui/constants/helper.dart';
import 'package:new_trip_ui/models/hotel_list_data.dart';

class GoogleMapProvider extends GetxController with Helper {
  LatLngBounds? visibleRegion;
  Size? visibleScreenSized;
  GoogleMapController? googleMapController;
  List<HotelListData> hotelList = HotelListData.hotelListData();
  HotelListData centerPoint = HotelListData.centerMapPin();
  List<Offset> polyLineOffsetList = [];

  void allReset() {
    polyLineOffsetList = [];
    visibleRegion = null;
    visibleScreenSized = null;
    googleMapController = null;
    hotelList = [];
    hotelList = HotelListData.hotelListData();
    update();
  }

  void updateGoogleMapController(GoogleMapController controller) {
    googleMapController = controller;
    _setPositionOnScreen();
    _stateChange();
  }

  void updateScreenVisibleArea(Size size) {
    visibleScreenSized = size;
    update();
  }

  void moveAndZoomPolyLineRoute(List<LatLng> latLng) {
    final list = Helper.getNeSw(latLng);

    googleMapController?.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
          northeast: list[0],
          southwest: list[1],
        ),
        100));
  }

  void _stateChange() {
    update();
  }

  Future _setPositionOnScreen() async {
    if (googleMapController != null && visibleScreenSized != null) {
      visibleRegion = await googleMapController?.getVisibleRegion();
      if (visibleRegion != null) {
        var sSize = visibleScreenSized;
        var sdl = visibleRegion!.northeast.latitude -
            visibleRegion!.southwest.latitude;
        var sdlg = visibleRegion!.southwest.longitude -
            visibleRegion!.northeast.longitude;
        if (googleMapController != null) {
          for (var item in hotelList) {
            if (item.location != null) {
              var fdl =
                  visibleRegion!.northeast.latitude - item.location!.latitude;
              var fdlg =
                  visibleRegion!.southwest.longitude - item.location!.longitude;
              item.screenMapPin = Offset(
                  (fdlg * sSize!.width) / sdlg, (fdl * sSize.height) / sdl);
            }
            if (item.isSelected == true) {
              polyLineOffsetList = [];

              for (var poly in item.polyLineList) {
                var fdlp = visibleRegion!.northeast.latitude - poly.latitude;
                var fdlgp = visibleRegion!.southwest.longitude - poly.longitude;
                final data = Offset(
                    (fdlgp * sSize!.width) / sdlg, (fdlp * sSize.height) / sdl);

                polyLineOffsetList.add(data);
              }
            }
          }
          var fdl = visibleRegion!.northeast.latitude -
              centerPoint.location!.latitude;
          var fdlg = visibleRegion!.southwest.longitude -
              centerPoint.location!.longitude;
          centerPoint.screenMapPin =
              Offset((fdlg * sSize!.width) / sdlg, (fdl * sSize.height) / sdl);
        }
      }
      _stateChange();
    }
  }
}
