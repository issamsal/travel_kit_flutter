import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/models/culture_details_data.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/card_view.dart';

class VisitPlaceCellView extends StatelessWidget {
  final PlaceVistData placeVistData;
  const VisitPlaceCellView({Key? key, required this.placeVistData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: CardView(
        elevation: 0,
        color: AppTheme.backgroundColor,
        radius: 8,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: Image.asset(
                placeVistData.imageName,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                    color: AppTheme.blackColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: Text(
                  placeVistData.title,
                  style: TextStyles(context).getRegularStyle().copyWith(
                      color: AppTheme.whiteColor, fontWeight: FontWeight.w900),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
