import 'package:new_trip_ui/constants/local_files.dart';

class CultureDetailsData {
  final String title;
  final String location;
  final String description;
  final String imageName;
  final List<String> gallery;
  final List<PlaceVistData> placeVisit;
  final List<PlaceVistData> hotelData;

  CultureDetailsData({
    required this.title,
    required this.location,
    required this.description,
    required this.gallery,
    required this.placeVisit,
    required this.imageName,
    required this.hotelData,
  });
}

class PlaceVistData {
  final String imageName;
  final String title;

  PlaceVistData({required this.imageName, required this.title});
}

class CultureDetailList {
  static List<CultureDetailsData> getCultureDataList = [
    CultureDetailsData(
      title: 'London',
      imageName: LocalFiles.london,
      location: 'United Kingdom',
      hotelData: [],
      description:
          'London is the capital and largest city of England and the United Kingdom with a total population of 9,002,488.[9] It stands on the River Thames in south-east England at the head of a 50-mile (80 km) estuary down to the North Sea, and has been a major settlement for two millennia. The City of London, its ancient core and financial centre, was founded by the Romans as Londinium and retains boundaries close to its medieval ones. ',
      gallery: [
        LocalFiles.london_1,
        LocalFiles.london_2,
        LocalFiles.london_3,
        LocalFiles.london_4,
        LocalFiles.london_5,
        LocalFiles.london_6,
      ],
      placeVisit: [
        PlaceVistData(
          imageName: LocalFiles.london_2,
          title: 'Buckingham palace',
        ),
        PlaceVistData(
          imageName: LocalFiles.london_6,
          title: 'Tower Bridge',
        ),
        PlaceVistData(
          imageName: LocalFiles.london_1p,
          title: 'Westminster Abbey',
        ),
        PlaceVistData(
          imageName: LocalFiles.london,
          title: 'London Eye',
        ),
      ],
    ),
    CultureDetailsData(
      title: 'Dubai',
      location: 'Dubai',
      imageName: LocalFiles.dubai_4p,
      description:
          'London is the capital and largest city of England and the United Kingdom with a total population of 9,002,488.[9] It stands on the River Thames in south-east England at the head of a 50-mile (80 km) estuary down to the North Sea, and has been a major settlement for two millennia. The City of London, its ancient core and financial centre, was founded by the Romans as Londinium and retains boundaries close to its medieval ones. ',
      gallery: [
        LocalFiles.dubai_1,
        LocalFiles.dubai_2,
        LocalFiles.dubai_3,
        LocalFiles.dubai_4,
        LocalFiles.dubai_5,
        LocalFiles.dubai_6,
      ],
      hotelData: [
        PlaceVistData(
          imageName: LocalFiles.hotelimage_2,
          title: 'Arena Bech Hotel',
        ),
        PlaceVistData(
          imageName: LocalFiles.hotelimage_2,
          title: 'Gilli Lankanfushi Maldives',
        ),
        PlaceVistData(
          imageName: LocalFiles.hotelimage_2,
          title: 'Sun island Resport & spa',
        ),
        PlaceVistData(
          imageName: LocalFiles.hotelimage_2,
          title: 'Kandima Maldives',
        ),
        PlaceVistData(
          imageName: LocalFiles.hotelimage_2,
          title: 'Raakani Home',
        )
      ],
      placeVisit: [
        PlaceVistData(
          imageName: LocalFiles.dubai_1p,
          title: 'Bruj Khalifa',
        ),
        PlaceVistData(
          imageName: LocalFiles.dubai_2p,
          title: 'Desert Safari',
        ),
        PlaceVistData(
          imageName: LocalFiles.dubai_3p,
          title: 'The Dubai Fountain',
        ),
        PlaceVistData(
          imageName: LocalFiles.dubai_4p,
          title: 'Dubai Frame',
        ),
      ],
    ),
    CultureDetailsData(
      title: 'Paris',
      location: 'France',
      imageName: LocalFiles.paris_1p,
      description:
          'London is the capital and largest city of England and the United Kingdom with a total population of 9,002,488.[9] It stands on the River Thames in south-east England at the head of a 50-mile (80 km) estuary down to the North Sea, and has been a major settlement for two millennia. The City of London, its ancient core and financial centre, was founded by the Romans as Londinium and retains boundaries close to its medieval ones. ',
      hotelData: [
        PlaceVistData(
          imageName: LocalFiles.hotelimage_2,
          title: 'Arena Bech Hotel',
        ),
        PlaceVistData(
          imageName: LocalFiles.hotelimage_2,
          title: 'Gilli Lankanfushi Maldives',
        ),
        PlaceVistData(
          imageName: LocalFiles.hotelimage_2,
          title: 'Sun island Resport & spa',
        ),
        PlaceVistData(
          imageName: LocalFiles.hotelimage_2,
          title: 'Kandima Maldives',
        ),
        PlaceVistData(
          imageName: LocalFiles.hotelimage_2,
          title: 'Raakani Home',
        )
      ],
      gallery: [
        LocalFiles.paris_1,
        LocalFiles.paris_2,
        LocalFiles.paris_3,
        LocalFiles.paris_4,
        LocalFiles.paris_5,
        LocalFiles.paris_6,
      ],
      placeVisit: [
        PlaceVistData(
          imageName: LocalFiles.paris_1p,
          title: 'Eiffel Tower',
        ),
        PlaceVistData(
          imageName: LocalFiles.paris_2p,
          title: 'The Louvre.',
        ),
        PlaceVistData(
          imageName: LocalFiles.paris_3p,
          title: 'Notre Dame Cathedral',
        ),
        PlaceVistData(
          imageName: LocalFiles.paris_4p,
          title: 'Arc De Triomphe.',
        ),
      ],
    ),
    CultureDetailsData(
      title: 'Thailand',
      location: 'Thailand',
      imageName: LocalFiles.thailand_1p,
      hotelData: [
        PlaceVistData(
          imageName: LocalFiles.hotelimage_2,
          title: 'Arena Bech Hotel',
        ),
        PlaceVistData(
          imageName: LocalFiles.hotelimage_2,
          title: 'Gilli Lankanfushi Maldives',
        ),
        PlaceVistData(
          imageName: LocalFiles.hotelimage_2,
          title: 'Sun island Resport & spa',
        ),
        PlaceVistData(
          imageName: LocalFiles.hotelimage_2,
          title: 'Kandima Maldives',
        ),
        PlaceVistData(
          imageName: LocalFiles.hotelimage_2,
          title: 'Raakani Home',
        )
      ],
      description:
          'London is the capital and largest city of England and the United Kingdom with a total population of 9,002,488.[9] It stands on the River Thames in south-east England at the head of a 50-mile (80 km) estuary down to the North Sea, and has been a major settlement for two millennia. The City of London, its ancient core and financial centre, was founded by the Romans as Londinium and retains boundaries close to its medieval ones. ',
      gallery: [
        LocalFiles.thailand_1,
        LocalFiles.thailand_2,
        LocalFiles.thailand_3,
        LocalFiles.thailand_4,
        LocalFiles.thailand_5,
        LocalFiles.thailand_6,
      ],
      placeVisit: [
        PlaceVistData(
          imageName: LocalFiles.thailand_1p,
          title: 'Railay Beach',
        ),
        PlaceVistData(
          imageName: LocalFiles.thailand_2p,
          title: 'koh phi phi',
        ),
        PlaceVistData(
          imageName: LocalFiles.thailand_3p,
          title: 'Pai',
        ),
        PlaceVistData(
          imageName: LocalFiles.thailand_4p,
          title: 'Sukho thai old City',
        ),
      ],
    ),
    CultureDetailsData(
      title: 'Maldives',
      imageName: LocalFiles.maldives_5,
      location: 'Maldives',
      hotelData: [
        PlaceVistData(
          imageName: LocalFiles.maldives_4,
          title: 'Raakani Home',
        )
      ],
      description:
          'London is the capital and largest city of England and the United Kingdom with a total population of 9,002,488.[9] It stands on the River Thames in south-east England at the head of a 50-mile (80 km) estuary down to the North Sea, and has been a major settlement for two millennia. The City of London, its ancient core and financial centre, was founded by the Romans as Londinium and retains boundaries close to its medieval ones. ',
      gallery: [
        LocalFiles.maldives_1,
        LocalFiles.maldives_2,
        LocalFiles.maldives_3,
        LocalFiles.maldives_4,
        LocalFiles.maldives_5,
        LocalFiles.maldives_6,
      ],
      placeVisit: [
        PlaceVistData(
          imageName: LocalFiles.maldives_6,
          title: 'Arena Bech Hotel',
        ),
        PlaceVistData(
          imageName: LocalFiles.maldives_3,
          title: 'Gilli Lankanfushi Maldives',
        ),
        PlaceVistData(
          imageName: LocalFiles.paris_3,
          title: 'Sun island Resport & spa',
        ),
        PlaceVistData(
          imageName: LocalFiles.hotelimage_2,
          title: 'Kandima Maldives',
        ),
      ],
    ),
  ];
}

class CategoryDetailList {
  static List<CultureDetailsData> getCategoryDataList = [
    CultureDetailsData(
      title: 'Maldives',
      imageName: LocalFiles.maldives_5,
      location: 'Maldives',
      hotelData: [
        PlaceVistData(
          imageName: LocalFiles.maldives_6,
          title: 'Arena Bech Hotel',
        ),
        PlaceVistData(
          imageName: LocalFiles.maldives_5,
          title: 'Gilli Lankanfushi Maldives',
        ),
        PlaceVistData(
          imageName: LocalFiles.maldives_4,
          title: 'Sun island Resport & spa',
        ),
        PlaceVistData(
          imageName: LocalFiles.hotelimage_2,
          title: 'Kandima Maldives',
        ),
        PlaceVistData(
          imageName: LocalFiles.maldives_4,
          title: 'Raakani Home',
        )
      ],
      description:
          'London is the capital and largest city of England and the United Kingdom with a total population of 9,002,488.[9] It stands on the River Thames in south-east England at the head of a 50-mile (80 km) estuary down to the North Sea, and has been a major settlement for two millennia. The City of London, its ancient core and financial centre, was founded by the Romans as Londinium and retains boundaries close to its medieval ones. ',
      gallery: [
        LocalFiles.maldives_1,
        LocalFiles.maldives_2,
        LocalFiles.maldives_3,
        LocalFiles.maldives_4,
        LocalFiles.maldives_5,
        LocalFiles.maldives_6,
      ],
      placeVisit: [
        PlaceVistData(
          imageName: LocalFiles.london_2,
          title: 'Buckingham palace',
        ),
        PlaceVistData(
          imageName: LocalFiles.london_6,
          title: 'Tower Bridge',
        ),
        PlaceVistData(
          imageName: LocalFiles.london_1p,
          title: 'Westminster Abbey',
        ),
        PlaceVistData(
          imageName: LocalFiles.london,
          title: 'London Eye',
        ),
      ],
    ),
    CultureDetailsData(
      title: 'Dubai',
      location: 'Dubai',
      imageName: LocalFiles.dubai_4p,
      hotelData: [
        PlaceVistData(
          imageName: LocalFiles.dubai_6,
          title: 'Milennium Hotel',
        ),
        PlaceVistData(
          imageName: LocalFiles.dubai_5,
          title: 'Bruh Khalifa',
        ),
        PlaceVistData(
          imageName: LocalFiles.dubai_1,
          title: 'Atana Hotel',
        ),
        PlaceVistData(
          imageName: LocalFiles.dubai_3,
          title: 'Bruj Al Arab',
        ),
        PlaceVistData(
          imageName: LocalFiles.dubai_6,
          title: 'Sheraton Dubai',
        )
      ],
      description:
          'London is the capital and largest city of England and the United Kingdom with a total population of 9,002,488.[9] It stands on the River Thames in south-east England at the head of a 50-mile (80 km) estuary down to the North Sea, and has been a major settlement for two millennia. The City of London, its ancient core and financial centre, was founded by the Romans as Londinium and retains boundaries close to its medieval ones. ',
      gallery: [
        LocalFiles.dubai_1,
        LocalFiles.dubai_2,
        LocalFiles.dubai_3,
        LocalFiles.dubai_4,
        LocalFiles.dubai_5,
        LocalFiles.dubai_6,
      ],
      placeVisit: [
        PlaceVistData(
          imageName: LocalFiles.dubai_1p,
          title: 'Bruj Khalifa',
        ),
        PlaceVistData(
          imageName: LocalFiles.dubai_2p,
          title: 'Desert Safari',
        ),
        PlaceVistData(
          imageName: LocalFiles.dubai_3p,
          title: 'The Dubai Fountain',
        ),
        PlaceVistData(
          imageName: LocalFiles.dubai_4p,
          title: 'Dubai Frame',
        ),
      ],
    ),
    CultureDetailsData(
      title: 'Paris',
      location: 'France',
      imageName: LocalFiles.paris_1p,
      description:
          'London is the capital and largest city of England and the United Kingdom with a total population of 9,002,488.[9] It stands on the River Thames in south-east England at the head of a 50-mile (80 km) estuary down to the North Sea, and has been a major settlement for two millennia. The City of London, its ancient core and financial centre, was founded by the Romans as Londinium and retains boundaries close to its medieval ones. ',
      gallery: [
        LocalFiles.paris_1,
        LocalFiles.paris_2,
        LocalFiles.paris_3,
        LocalFiles.paris_4,
        LocalFiles.paris_5,
        LocalFiles.paris_6,
      ],
      hotelData: [
        PlaceVistData(
          imageName: LocalFiles.paris_6,
          title: 'Hotel Maison Mere',
        ),
        PlaceVistData(
          imageName: LocalFiles.paris_5,
          title: 'Le pavillon de la Reine',
        ),
        PlaceVistData(
          imageName: LocalFiles.paris_6,
          title: 'Geneator Spa',
        ),
        PlaceVistData(
          imageName: LocalFiles.paris_2,
          title: 'Maison Barbes',
        ),
        PlaceVistData(
          imageName: LocalFiles.paris_4,
          title: 'Pullman Paris Tour Eiffel',
        )
      ],
      placeVisit: [
        PlaceVistData(
          imageName: LocalFiles.paris_1p,
          title: 'Eiffel Tower',
        ),
        PlaceVistData(
          imageName: LocalFiles.paris_2p,
          title: 'The Louvre.',
        ),
        PlaceVistData(
          imageName: LocalFiles.paris_3p,
          title: 'Notre Dame Cathedral',
        ),
        PlaceVistData(
          imageName: LocalFiles.paris_4p,
          title: 'Arc De Triomphe.',
        ),
      ],
    ),
    CultureDetailsData(
      title: 'Thailand',
      location: 'Thailand',
      imageName: LocalFiles.thailand_1p,
      hotelData: [
        PlaceVistData(
          imageName: LocalFiles.thailand_5,
          title: 'Amarin',
        ),
        PlaceVistData(
          imageName: LocalFiles.thailand_6,
          title: 'Absolute Sanctuary',
        ),
        PlaceVistData(
          imageName: LocalFiles.thailand_3,
          title: 'Phalarn inn Resort',
        ),
        PlaceVistData(
          imageName: LocalFiles.thailand_4,
          title: 'The Sea',
        ),
        PlaceVistData(
          imageName: LocalFiles.thailand_6,
          title: 'Bootshaus',
        )
      ],
      description:
          'London is the capital and largest city of England and the United Kingdom with a total population of 9,002,488.[9] It stands on the River Thames in south-east England at the head of a 50-mile (80 km) estuary down to the North Sea, and has been a major settlement for two millennia. The City of London, its ancient core and financial centre, was founded by the Romans as Londinium and retains boundaries close to its medieval ones. ',
      gallery: [
        LocalFiles.thailand_1,
        LocalFiles.thailand_2,
        LocalFiles.thailand_3,
        LocalFiles.thailand_4,
        LocalFiles.thailand_5,
        LocalFiles.thailand_6,
      ],
      placeVisit: [
        PlaceVistData(
          imageName: LocalFiles.thailand_1p,
          title: 'Railay Beach',
        ),
        PlaceVistData(
          imageName: LocalFiles.thailand_2p,
          title: 'koh phi phi',
        ),
        PlaceVistData(
          imageName: LocalFiles.thailand_3p,
          title: 'Pai',
        ),
        PlaceVistData(
          imageName: LocalFiles.thailand_4p,
          title: 'Sukho thai old City',
        ),
      ],
    ),
  ];
}
