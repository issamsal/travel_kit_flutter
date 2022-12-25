import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/models/hotel_list_data.dart';
import 'package:new_trip_ui/routes/navigator.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/custom_button.dart';

class MapHotelView extends StatefulWidget {
  final HotelListData hotelListData;
  const MapHotelView({Key? key, required this.hotelListData}) : super(key: key);

  @override
  State<MapHotelView> createState() => _MapHotelViewState();
}

class _MapHotelViewState extends State<MapHotelView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppTheme.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        side: BorderSide(
          color: AppTheme.primaryTextColor.withOpacity(0.2),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: 12.0,
            right: 12.0,
            top: 8,
            bottom: MediaQuery.of(context).padding.bottom + 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                widget.hotelListData.hotelImage,
                height: 120,
                width: 110,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 0, top: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Text(
                                widget.hotelListData.hotelName,
                                style: TextStyles(context)
                                    .getBoldStyle()
                                    .copyWith(fontSize: 16),
                              ),
                            ),
                            Row(
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
                                        .copyWith(
                                            color: AppTheme.secondaryTextColor),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${widget.hotelListData.hotelPrice} ',
                              style: TextStyles(context)
                                  .getBoldStyle()
                                  .copyWith(fontSize: 20),
                            ),
                            Text('/${Loc.alized.per_night_text}',
                                style: TextStyles(context)
                                    .getDescriptionStyle()
                                    .copyWith())
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          Icon(
                            Icons.star_rate_rounded,
                            color: i == 4
                                ? AppTheme.secondaryTextColor
                                : Colors.yellow,
                            size: 18,
                          ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, left: 2),
                          child: Text(
                            '4.0',
                            style: TextStyles(context)
                                .getDescriptionStyle()
                                .copyWith(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: CustomButton(
                        height: 38,
                        onTap: () {
                          NavigationServices()
                              .gotoHotelPage(widget.hotelListData);
                        },
                        textWidget: CustomButtonText(
                            text: Loc.alized.book_now_text,
                            textcolor: AppTheme.whiteColor),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
