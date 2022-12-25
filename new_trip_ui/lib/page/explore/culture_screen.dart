import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/local_files.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/card_view.dart';

class CultureScreen extends StatelessWidget {
  final CultureData getcultureDetails;
  final VoidCallback onTap;
//   final AnimationController animationController;
//   final Animation<double> animation;

  const CultureScreen({
    Key? key,
    required this.getcultureDetails,
    required this.onTap,
    // required this.animationController,
    // required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8),
      child: CardView(
        shadowColor: Colors.transparent,
        radius: 16,
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: AspectRatio(
                  aspectRatio: 1.9,
                  child: Image.asset(
                    getcultureDetails.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(getcultureDetails.titleText,
                              style: TextStyles(context)
                                  .getTitleStyle()
                                  .copyWith(fontSize: 20)),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                                getcultureDetails.subTitleText.toUpperCase(),
                                style: TextStyles(context)
                                    .getDescriptionStyle()
                                    .copyWith(
                                        color: Theme.of(context).disabledColor,
                                        fontSize: 12)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            for (var i = 0; i < 5; i++,)
                              Icon(
                                Icons.star,
                                size: 18,
                                color: AppTheme.yellowColor,
                              ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(Loc.alized.explore_more,
                                style:
                                    TextStyles(context).getDescriptionStyle()),
                            Icon(
                              Icons.arrow_right_alt,
                              color: AppTheme.primaryColor,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CultureData {
  String titleText;
  String subTitleText;
  String imagePath;

  CultureData({
    required this.titleText,
    required this.subTitleText,
    required this.imagePath,
  });

  static List<CultureData> getCultureDetails = [
    CultureData(
        titleText: 'London',
        subTitleText: Loc.alized.tataouine_sahara,
        imagePath: LocalFiles.london),
    CultureData(
      titleText: 'Dubai',
      subTitleText: Loc.alized.santorini_greece,
      imagePath: LocalFiles.dubai_2p,
    ),
    CultureData(
        titleText: 'Paris',
        subTitleText: Loc.alized.high_text,
        imagePath: LocalFiles.paris_1p),
    CultureData(
      titleText: 'Thailand',
      subTitleText: Loc.alized.tataouine_desert,
      imagePath: LocalFiles.thailand_1p,
    ),
    CultureData(
      titleText: 'Maldives',
      subTitleText: Loc.alized.tataouine_desert,
      imagePath: LocalFiles.maldives_6,
    ),
  ];
}
