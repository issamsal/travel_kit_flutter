import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/providers/google_map_provider.dart';
import 'package:new_trip_ui/page/location/components/map_painter.dart';
import 'package:new_trip_ui/page/location/map_hotel_view.dart';
import 'package:new_trip_ui/widgets/card_view.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage>
    with TickerProviderStateMixin {
  LatLng userLocation = const LatLng(51.495515, -0.100733);
  GoogleMapController? _googleMapController;
  late AnimationController repeatLineAnimationController;
  late AnimationController lineAnimationController;

  @override
  void initState() {
    Get.find<GoogleMapProvider>().allReset();
    lineAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    repeatLineAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    lineAnimationController.dispose();
    repeatLineAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        Get.find<GoogleMapProvider>().updateScreenVisibleArea(
            Size(constraint.maxWidth, constraint.maxHeight));
        return GetBuilder<GoogleMapProvider>(
          builder: (mapController) {
            final data =
                mapController.hotelList.where((element) => element.isSelected);
            if (data.isNotEmpty) {
              lineAnimationController.forward();
              repeatLineAnimationController.repeat();
            } else {
              repeatLineAnimationController.reset();
              lineAnimationController.reverse();
            }
            return Scaffold(
              body: Stack(
                children: [
                  GoogleMap(
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: false,
                    onCameraMove: (CameraPosition postion) {
                      if (_googleMapController != null) {
                        mapController
                            .updateGoogleMapController(_googleMapController!);
                      }
                    },
                    onTap: (a) {
                      for (var item in mapController.hotelList) {
                        item.isSelected = false;
                        setState(() {});
                        mapController.update();
                      }
                    },
                    initialCameraPosition:
                        CameraPosition(target: userLocation, zoom: 13),
                    onMapCreated: (controller) async {
                      _googleMapController = controller;
                      mapController.updateGoogleMapController(controller);
                      _googleMapController?.setMapStyle(
                          await DefaultAssetBundle.of(context).loadString(
                        AppTheme.isLightTheme
                            ? "asset/json/mapstyle_light.json"
                            : "asset/json/mapstyle_dark.json",
                      ));
                    },
                  ),
                  for (var item in mapController.hotelList)
                    if (item.isSelected == true)
                      IgnorePointer(
                        child: AnimatedBuilder(
                          animation: lineAnimationController,
                          builder: (context, child) => CustomPaint(
                            painter: NormalMapLinePainter(
                              points: mapController.polyLineOffsetList,
                              repetAnimation: lineAnimationController,
                              //   color: AppTheme.primaryColor,
                            ),
                            size: MediaQuery.of(context).size,
                          ),
                        ),
                      ),
                  for (var item in mapController.hotelList)
                    if (item.isSelected == true)
                      IgnorePointer(
                        child: AnimatedBuilder(
                          animation: repeatLineAnimationController,
                          builder: (context, child) => CustomPaint(
                            painter: MapLinePainter(
                              points: mapController.polyLineOffsetList,
                              repetAnimation: repeatLineAnimationController,
                              color: AppTheme.whiteColor,
                            ),
                            size: MediaQuery.of(context).size,
                          ),
                        ),
                      ),
                  for (var item in mapController.hotelList)
                    item.screenMapPin != null
                        ? AnimatedPositioned(
                            duration: const Duration(milliseconds: 1),
                            top: item.screenMapPin!.dy - 15,
                            left: item.screenMapPin!.dx - 15,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Material(
                                    color: Colors.transparent,
                                    child: GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () async {
                                          if (item.isSelected == false) {
                                            for (var f
                                                in mapController.hotelList) {
                                              f.isSelected = false;
                                              mapController.update();
                                            }

                                            item.isSelected = true;
                                            mapController
                                                .updateGoogleMapController(
                                                    _googleMapController!);
                                            mapController
                                                .moveAndZoomPolyLineRoute(
                                                    item.polyLineList);
                                          }
                                        },
                                        child: item.isSelected
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.all(7),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        AppTheme.primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Container(
                                                      height: 10,
                                                      width: 10,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            AppTheme.whiteColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      )),
                                                ),
                                              )
                                            : _getPinUI()),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox(),
                  if (mapController.centerPoint.screenMapPin != null)
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 1),
                      top: mapController.centerPoint.screenMapPin!.dy - 29,
                      left: mapController.centerPoint.screenMapPin!.dx - 29,
                      child: SizedBox(
                        height: 58,
                        width: 58,
                        child: _centerUI(),
                      ),
                    ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16, right: 16),
                          child: CardView(
                            elevation: 0,
                            radius: 26,
                            borderColor:
                                AppTheme.primaryTextColor.withOpacity(0.2),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(26),
                              onTap: () {
                                _googleMapController?.animateCamera(
                                  CameraUpdate.newLatLng(
                                    const LatLng(51.495515, -0.100733),
                                  ),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.gps_fixed,
                                ),
                              ),
                            ),
                          ),
                        ),
                        for (var item in mapController.hotelList)
                          if (item.isSelected)
                            Builder(
                              builder: (context) {
                                final index = mapController.hotelList
                                    .indexWhere((element) =>
                                        element.isSelected == true);
                                return MapHotelView(
                                  hotelListData: mapController.hotelList[index],
                                );
                              },
                            ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 8,
                    left: 24,
                    child: getAppBar(),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _centerUI() {
    return Stack(
      children: [
        Container(
          height: 58,
          width: 58,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: CardView(
              color: AppTheme.primaryColor,
              radius: 48,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.near_me_sharp,
                  color: AppTheme.whiteColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getPinUI() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: AppTheme.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget getAppBar() {
    return CardView(
      elevation: 0,
      radius: 8,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          Navigator.pop(context);
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.keyboard_arrow_left_outlined,
          ),
        ),
      ),
    );
  }
}
