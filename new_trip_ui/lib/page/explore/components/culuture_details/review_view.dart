import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_trip_ui/constants/local_files.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/card_view.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageCode = Get.find<Loc>().locale.languageCode;
    return CardView(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ratingStar(),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Row(
                    children: [
                      Text(
                        '2.3k ${Loc.alized.reviews_text}',
                        style: TextStyles(context)
                            .getRegularStyle()
                            .copyWith(color: AppTheme.secondaryTextColor),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: AppTheme.secondaryTextColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                _getCircleImage(LocalFiles.avatar2),
                Positioned(
                  top: 0,
                  left: languageCode == 'ar' ? 16 : -16,
                  child: _getCircleImage(LocalFiles.avatar1),
                ),
                Positioned(
                  top: 0,
                  left: languageCode == 'ar' ? 32 : -32,
                  child: _getCircleImage(LocalFiles.avatar3),
                ),
                Positioned(
                  top: 0,
                  left: languageCode == 'ar' ? 48 : -48,
                  child: _getCircleImage(LocalFiles.avatar4),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _getCircleImage(String imageName) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.0),
      child: Image.asset(
        imageName,
        height: 28,
        width: 28,
      ),
    );
  }

  Widget ratingStar() {
    return Row(
      children: [
        for (int i = 0; i < 5; i++)
          Icon(
            Icons.star,
            size: 16,
            color: i == 4 ? AppTheme.secondaryTextColor : Colors.yellow,
          )
      ],
    );
  }
}
