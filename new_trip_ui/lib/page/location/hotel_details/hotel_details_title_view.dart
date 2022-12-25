import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/models/hotel_list_data.dart';
import 'package:new_trip_ui/utils/text_styles.dart';

class HotelDetailsTitleView extends StatelessWidget {
  final HotelListData hotelListData;
  const HotelDetailsTitleView({Key? key, required this.hotelListData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 24.0, top: 4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      hotelListData.hotelName,
                      style: TextStyles(context)
                          .getBoldStyle()
                          .copyWith(fontSize: 22),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0, top: 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: AppTheme.secondaryTextColor,
                          size: 18,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            'Maldives',
                            style: TextStyles(context)
                                .getDescriptionStyle()
                                .copyWith(color: AppTheme.secondaryTextColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 4),
                    child: Row(
                      children: [
                        ratingStar(),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            '80 ${Loc.alized.reviews_text}',
                            style: TextStyles(context)
                                .getRegularStyle()
                                .copyWith(color: AppTheme.secondaryTextColor),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    hotelListData.hotelPrice,
                    style: TextStyles(context)
                        .getBoldStyle()
                        .copyWith(fontSize: 22),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      '/${Loc.alized.per_night_text}',
                      style: TextStyles(context).getRegularStyle().copyWith(
                            fontSize: 14,
                            color: AppTheme.secondaryTextColor,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 8.0, right: 0.0, top: 8, bottom: 4),
            child: Divider(
              height: 1,
              color: AppTheme.secondaryTextColor,
            ),
          )
        ],
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
