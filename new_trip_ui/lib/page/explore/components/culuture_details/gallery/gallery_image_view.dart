import 'package:flutter/material.dart';
import 'package:new_trip_ui/models/culture_details_data.dart';
import 'package:new_trip_ui/page/explore/components/culuture_details/gallery/gallery_image_cell_view.dart';

class GalleryImageView extends StatefulWidget {
  final AnimationController animationController;
  final CultureDetailsData cultureDetailsData;
  const GalleryImageView(
      {Key? key,
      required this.animationController,
      required this.cultureDetailsData})
      : super(key: key);

  @override
  State<GalleryImageView> createState() => _GalleryImageViewState();
}

class _GalleryImageViewState extends State<GalleryImageView> {
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: widget.animationController, curve: Curves.fastOutSlowIn)),
      child: Transform(
        transform: Matrix4.translationValues(
            40 * (1 - widget.animationController.value), 0, 0),
        child: SizedBox(
          height: 90,
          child: ListView.builder(
            padding: const EdgeInsets.only(right: 16, left: 16),
            itemCount: widget.cultureDetailsData.gallery.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GalleryimageCellView(
                imageName: widget.cultureDetailsData.gallery[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
