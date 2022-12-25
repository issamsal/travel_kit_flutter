import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/local_files.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/widgets/card_view.dart';

class HotelRoomeList extends StatefulWidget {
  final AnimationController animationController;
  const HotelRoomeList({Key? key, required this.animationController})
      : super(key: key);

  @override
  State<HotelRoomeList> createState() => _HotelRoomeListState();
}

class _HotelRoomeListState extends State<HotelRoomeList> {
  List<String> photosList = [
    LocalFiles.hotelimage_1,
    LocalFiles.hotelimage_2,
    LocalFiles.hotelimage_3,
    LocalFiles.hotelimage_4,
    LocalFiles.hotelimage_5,
    LocalFiles.hotelimage_6,
    LocalFiles.hotelimage_7,
  ];

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: widget.animationController,
      child: Transform(
        transform: Matrix4.translationValues(
            50 * (1 - widget.animationController.value), 0, 0),
        child: SizedBox(
          height: 90,
          child: ListView.builder(
            padding: const EdgeInsets.only(right: 16, left: 16),
            itemCount: photosList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: CardView(
                  elevation: 0,
                  color: AppTheme.backgroundColor,
                  radius: 8,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(
                        photosList[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
