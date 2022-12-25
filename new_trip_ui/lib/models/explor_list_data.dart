import 'package:new_trip_ui/constants/local_files.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';

class ExploreData {
  static List<CategoryData> getCategoryDataList = [
    CategoryData(
      title: Loc.alized.advanture_text,
      imageName: 'asset/images/advant.jpg',
    ),
    CategoryData(
      title: Loc.alized.beach_text,
      imageName: 'asset/images/beach.jpg',
    ),
    CategoryData(
      title: Loc.alized.disney_text,
      imageName: 'asset/images/disney.jpg',
    ),
    CategoryData(
      title: Loc.alized.ski_text,
      imageName: 'asset/images/ski.jpg',
    ),
    CategoryData(
      title: Loc.alized.bali_text,
      imageName: 'asset/images/bali.jpg',
    ),
  ];

  static List<CategoryData> getPopularDataList = [
    CategoryData(
      title: Loc.alized.maldives_text,
      imageName: LocalFiles.maldives_3,
    ),
    CategoryData(
      title: 'Dubai',
      imageName: LocalFiles.dubai_2,
    ),
    CategoryData(
      title: Loc.alized.paris_text,
      imageName: 'asset/images/paris.jpg',
    ),
    CategoryData(
      title: Loc.alized.thailand_text,
      imageName: LocalFiles.thailand_1,
    ),
  ];

  static List<CategoryData> getMostVisitedView = [
    CategoryData(
      title: Loc.alized.paris_text,
      imageName: 'asset/images/paris.jpg',
    ),
    CategoryData(
      title: Loc.alized.thailand_text,
      imageName: 'asset/images/thailand.jpg',
    ),
    CategoryData(
      title: Loc.alized.maldives_text,
      imageName: LocalFiles.maldives_3,
    ),
    CategoryData(
      title: 'Dubai',
      imageName: LocalFiles.dubai_2,
    ),
  ];
}

class CategoryData {
  final String imageName;
  final String title;

  CategoryData({required this.imageName, required this.title});
}
