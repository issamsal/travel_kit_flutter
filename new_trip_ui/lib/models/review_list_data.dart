import 'package:new_trip_ui/constants/local_files.dart';

class ReviewList {
  static List<ReviewData> reviewListData = [
    ReviewData(
      imagePath: LocalFiles.avatar1,
      titleTxt: 'Alexia Jane',
      subTxt:
          'This is located in a great spot close to shops and bars, very quiet location',
    ),
    ReviewData(
      imagePath: LocalFiles.avatar3,
      titleTxt: 'Jacky Depp',
      subTxt:
          'Good staff, very comfortable bed, very quiet location, place could do with an update',
    ),
    ReviewData(
      imagePath: LocalFiles.avatar5,
      titleTxt: 'Alex Carl',
      subTxt:
          'This is located in a great spot close to shops and bars, very quiet location',
    ),
    ReviewData(
      imagePath: LocalFiles.avatar2,
      titleTxt: 'May June',
      subTxt:
          'Good staff, very comfortable bed, very quiet location, place could do with an update',
    ),
    ReviewData(
      imagePath: LocalFiles.avatar4,
      titleTxt: 'Lesley Rivas',
      subTxt:
          'This is located in a great spot close to shops and bars, very quiet location',
    ),
    ReviewData(
      imagePath: LocalFiles.avatar6,
      titleTxt: 'Carlos Lasmar',
      subTxt:
          'Good staff, very comfortable bed, very quiet location, place could do with an update',
    ),
    ReviewData(
      imagePath: LocalFiles.avatar7,
      titleTxt: 'Oliver Smith',
      subTxt:
          'This is located in a great spot close to shops and bars, very quiet location',
    ),
  ];
}

class ReviewData {
  final String imagePath;
  final String titleTxt;
  final String subTxt;
  final String rating;
  final String dateText;

  ReviewData(
      {required this.imagePath,
      required this.titleTxt,
      required this.subTxt,
      this.rating = '7.0',
      this.dateText = '21 May, 2021'});
}
