//   void _createMapPin() async {
//     Future<ui.Image> createImage(double size, {ui.Image? pinImage}) async {
//       var source = Rect.fromLTWH(0, 0, size, size);

//       ui.PictureRecorder recorder = ui.PictureRecorder();
//       Canvas canvas2 = Canvas(recorder);
//       Paint paint2 = Paint();

//       canvas2.drawImageRect(
//           pinImage!,
//           Rect.fromLTWH(
//               0, 0, pinImage.width.toDouble(), pinImage.height.toDouble()),
//           source,
//           paint2..color = AppTheme.primaryColor);
//       return await recorder
//           .endRecording()
//           .toImage(source.width.toInt(), source.height.toInt());
//     }

//     ImageLoader.load(LocalFiles.hotel_pin).then((image) async {
//       var pickUp420 = image;
//       var finalPickUpImage = await createImage(110, pinImage: pickUp420);
//       Uint8List pngBytes =
//           (await finalPickUpImage.toByteData(format: ui.ImageByteFormat.png))!
//               .buffer
//               .asUint8List();
//       bitmapDescriptorPinLocation = BitmapDescriptor.fromBytes(pngBytes);
//     });

//     setState(() {});
//   }


//   setPolyLinePoint() async {
//     PolylinePoints polylinePoints = PolylinePoints();
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       "AIzaSyDbvgnjdATGqov36-akb8-RgLcSt2P6coA",
//       const PointLatLng(51.460141, -0.116359),
//       const PointLatLng(51.488304, -0.076826),
//     );
//     if (result.points.isNotEmpty) {
//       for (var element in result.points) {
//         polylineList.add(LatLng(element.latitude, element.longitude));
//       }
//     }
//   }



//   Map<MarkerId, Marker> onSetMarker() {
//     Map<MarkerId, Marker> markers = {};
//     try {
//       if (mapViewType == MapViewType.pickUplocation) {
//         MarkerId markerId = const MarkerId('Pick up');
//         Marker marker = Marker(
//             markerId: markerId,
//             position: userLocation,
//             icon: bitmapDescriptorPinLocation!);
//         markers.addAll({markerId: marker});
//       } else if ((mapViewType == MapViewType.polylineMapView)) {
//         MarkerId markerId1 = const MarkerId('1');
//         Marker marker1 = Marker(
//             markerId: markerId1,
//             position: const LatLng(51.46014, -0.11635),
//             icon: bitmapDescriptorPinLocation!);
//         markers.addAll({markerId1: marker1});
//         MarkerId markerId2 = const MarkerId('2');
//         Marker marker2 = Marker(
//             markerId: markerId2,
//             position: const LatLng(51.488304, -0.076826),
//             icon: bitmapDescriptorPinLocation!);
//         markers.addAll({markerId2: marker2});
//       }
//     } catch (e) {}
//     return markers;
//   }


 // Positioned(
                //   top: MediaQuery.of(context).padding.top + 8,
                //   left: 24,
                //   child: CardView(
                //     color: AppTheme.backgroundColor,
                //     elevation: 0,
                //     child: InkWell(
                //       onTap: () {
                //         onBackClick();
                //       },
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Icon(
                //           Icons.keyboard_arrow_left_rounded,
                //           color: AppTheme.primaryTextColor,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // Positioned(
                //   bottom: MediaQuery.of(context).padding.bottom + 16,
                //   left: 24,
                //   right: 24,
                //   child: mapViewType == MapViewType.pickUplocation
                //       ? PickUpView(
                //           onTap: () {
                //             setState(() {
                //               mapViewType = MapViewType.polylineMapView;
                //             });
                //             _googleMapController?.animateCamera(
                //                 CameraUpdate.newLatLngZoom(
                //                     const LatLng(51.475952, -0.097781), 13.05));
                //           },
                //         )
                //       : mapViewType == MapViewType.polylineMapView
                //           ? const MapHotelView()
                //           : const SizedBox(),
                // ),


//                 class ImageLoader {
//   static ui.AssetBundle getAssetBundle() => (ui.rootBundle != null)
//       ? ui.rootBundle
//       : ui.NetworkAssetBundle(Uri.directory(Uri.base.origin));
//   /*
//    * convert to painting.Image
//    */
//   static Future<ui.Image> load(String url) async {
//     ui.ImageStream stream = ui.AssetImage(url, bundle: getAssetBundle())
//         .resolve(ui.ImageConfiguration.empty);
//     Completer<ui.Image> completer = Completer<ui.Image>();
//     ImageStreamListener? listener;
//     listener = ImageStreamListener((ImageInfo frame, bool synchronousCall) {
//       final ui.Image image = frame.image;
//       completer.complete(image);
//       stream.removeListener(listener!);
//     });
//     stream.addListener(listener);
//     return completer.future;
//   }

//   static Future<ui.Image> getImage(File image) async {
//     Completer<ui.Image> completer = Completer();
//     Image.file(image)
//         .image
//         .resolve(const ImageConfiguration())
//         .addListener(ImageStreamListener((ImageInfo info, bool _) {
//       completer.complete(info.image);
//     }));
//     ui.Image imageData = await completer.future;
//     return imageData;
//   }