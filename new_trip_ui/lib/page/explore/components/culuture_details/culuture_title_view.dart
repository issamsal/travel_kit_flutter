import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/models/culture_details_data.dart';
import 'package:new_trip_ui/utils/text_styles.dart';

class CulutretitleView extends StatelessWidget {
  final CultureDetailsData cultureDetailsData;
  const CulutretitleView({Key? key, required this.cultureDetailsData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Text(
                    cultureDetailsData.title,
                    style: TextStyles(context).getTitleStyle(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 6, right: 6, top: 2, bottom: 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: AppTheme.secondaryTextColor,
                        size: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0, top: 2),
                        child: Text(
                          cultureDetailsData.location,
                          style: TextStyles(context).getDescriptionStyle(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: Container(
                          height: 14,
                          width: 1,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      ratingStar()
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$138',
                    style: TextStyles(context).getTitleStyle(),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '/${Loc.alized.per_person_text}',
                    style: TextStyles(context).getDescriptionStyle(),
                  )
                ],
              ),
            )
          ],
        ),
        Divider(
          height: 1,
          color: AppTheme.secondaryTextColor,
        ),
      ],
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
