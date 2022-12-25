import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_trip_ui/constants/local_files.dart';

class HotelListData {
  LatLng? location;
  bool isSelected;
  final String hotelName;
  final String hotelPrice;
  final String hotelImage;
  Offset? screenMapPin;

  final List<LatLng> polyLineList;
  HotelListData({
    required this.polyLineList,
    this.location,
    this.isSelected = false,
    this.screenMapPin,
    this.hotelName = '',
    this.hotelPrice = '',
    this.hotelImage = '',
  });

  static List<HotelListData> hotelListData() => [
        HotelListData(
            location: const LatLng(51.473156, -0.121736),
            isSelected: false,
            hotelName: 'Riu Atoll-All Inclusive',
            hotelImage: LocalFiles.maldives_1,
            hotelPrice: '\$150',
            polyLineList: const [
              LatLng(51.495515, -0.100733),
              LatLng(51.494378, -0.100696),
              LatLng(51.492856, -0.100986),
              LatLng(51.491436, -0.103075),
              LatLng(51.490842, -0.105801),
              LatLng(51.489098, -0.110446),
              LatLng(51.488163, -0.111497),
              LatLng(51.487188, -0.112699),
              LatLng(51.486934, -0.114802),
              LatLng(51.486199, -0.122097),
              LatLng(51.486039, -0.121990),
              LatLng(51.484409, -0.122934),
              LatLng(51.483821, -0.123127),
              LatLng(51.482311, -0.124329),
              LatLng(51.481228, -0.124651),
              LatLng(51.479224, -0.123621),
              LatLng(51.477179, -0.123281),
              LatLng(51.474212, -0.122594),
              LatLng(51.473517, -0.122380),
              LatLng(51.473156, -0.121736),
            ]),
        HotelListData(
            location: const LatLng(51.474192, -0.077900),
            isSelected: false,
            hotelPrice: '\$138',
            hotelName: 'Hard Rock Maldives',
            hotelImage: LocalFiles.maldives_2,
            polyLineList: const [
              LatLng(51.495515, -0.100733),
              LatLng(51.490154, -0.097030),
              LatLng(51.485237, -0.093854),
              LatLng(51.479945, -0.094369),
              LatLng(51.478970, -0.094090),
              LatLng(51.480480, -0.090506),
              LatLng(51.477807, -0.082696),
              LatLng(51.474192, -0.077900),
            ]),
        HotelListData(
            location: const LatLng(51.511327, -0.119250),
            isSelected: false,
            hotelPrice: '\$200',
            hotelName: 'Meeru island Resort',
            hotelImage: LocalFiles.maldives_4,
            polyLineList: const [
              LatLng(51.495515, -0.100733),
              LatLng(51.496208, -0.101598),
              LatLng(51.497098, -0.102721),
              LatLng(51.498336, -0.104240),
              LatLng(51.498650, -0.104573),
              LatLng(51.498794, -0.104637),
              LatLng(51.498787, -0.104840),
              LatLng(51.498724, -0.105173),
              LatLng(51.498705, -0.105473),
              LatLng(51.498798, -0.105763),
              LatLng(51.499878, -0.107160),
              LatLng(51.502269, -0.110014),
              LatLng(51.504059, -0.112031),
              LatLng(51.504575, -0.113150),
              LatLng(51.505089, -0.113300),
              LatLng(51.505208, -0.113747),
              LatLng(51.505438, -0.114028),
              LatLng(51.506590, -0.115112),
              LatLng(51.507325, -0.115849),
              LatLng(51.508113, -0.116544),
              LatLng(51.508634, -0.116994),
              LatLng(51.509410, -0.117699),
              LatLng(51.510102, -0.118335),
              LatLng(51.510469, -0.118641),
              LatLng(51.510893, -0.118975),
              LatLng(51.511327, -0.119250),
            ]),
        HotelListData(
            location: const LatLng(51.517505, -0.088567),
            isSelected: false,
            hotelPrice: '\$230',
            hotelName: 'Kagi Maldives Island',
            hotelImage: LocalFiles.maldives_6,
            polyLineList: const [
              LatLng(51.495515, -0.100733),
              LatLng(51.496539, -0.099724),
              LatLng(51.499051, -0.097107),
              LatLng(51.501295, -0.093158),
              LatLng(51.504260, -0.090841),
              LatLng(51.506104, -0.088438),
              LatLng(51.509951, -0.087064),
              LatLng(51.512341, -0.088030),
              LatLng(51.517505, -0.088567),
            ]),
      ];

  static HotelListData centerMapPin() {
    return HotelListData(
      location: const LatLng(51.495515, -0.100733),
      isSelected: false,
      polyLineList: [],
      hotelPrice: '\$138',
      hotelName: 'Samann Host',
      hotelImage: LocalFiles.maldives_1,
    );
  }
}
