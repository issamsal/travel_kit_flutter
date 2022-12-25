import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/widgets/card_view.dart';

class GalleryimageCellView extends StatelessWidget {
  final String imageName;
  const GalleryimageCellView({Key? key, required this.imageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: CardView(
        elevation: 0,
        color: AppTheme.backgroundColor,
        radius: 8,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              imageName,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
