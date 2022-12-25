import 'package:new_trip_ui/logic/language/app_localizations.dart';

import '../constants/local_files.dart';

class PageViewData {
  final String titleText;
  final String subText;
  final String assetsImage;

  PageViewData(
      {required this.titleText,
      required this.subText,
      required this.assetsImage});

  static List<PageViewData> getIntroduction = [
    PageViewData(
      titleText: Loc.alized.explore,
      subText: Loc.alized.explore_des,
      assetsImage: LocalFiles.introduction_1,
    ),
    PageViewData(
      titleText: Loc.alized.pick,
      subText: Loc.alized.pick_des,
      assetsImage: LocalFiles.introduction_2,
    ),
    PageViewData(
      titleText: Loc.alized.pick_travel,
      subText: Loc.alized.pick_travel_des,
      assetsImage: LocalFiles.introduction_3,
    ),
  ];
}
