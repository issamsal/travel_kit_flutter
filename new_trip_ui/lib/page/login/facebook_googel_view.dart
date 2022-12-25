import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/card_view.dart';

class FaceBookAndGoogleView extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  const FaceBookAndGoogleView(
      {Key? key, required this.title, required this.color, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardView(
      radius: 24,
      borderColor: Colors.transparent,
      elevation: 0,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 22,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8, top: 4, bottom: 4),
              child: Text(
                title,
                style: TextStyles(context)
                    .getRegularStyle()
                    .copyWith(color: AppTheme.whiteColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
