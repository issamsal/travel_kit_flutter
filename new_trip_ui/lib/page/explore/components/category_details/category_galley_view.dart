import 'package:flutter/material.dart';

import 'package:new_trip_ui/models/culture_details_data.dart';
import 'package:new_trip_ui/page/explore/components/culuture_details/gallery/gallery_image_cell_view.dart';

class CategoryGalleryView extends StatefulWidget {
  final CultureDetailsData cultureDetailsData;
  final AnimationController animationController;
  const CategoryGalleryView(
      {Key? key,
      required this.cultureDetailsData,
      required this.animationController})
      : super(key: key);

  @override
  State<CategoryGalleryView> createState() => _CategoryGalleryViewState();
}

class _CategoryGalleryViewState extends State<CategoryGalleryView> {
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: widget.animationController,
      child: Transform(
        transform: Matrix4.translationValues(
            70 * (1 - widget.animationController.value), 0, 0),
        child: SizedBox(
          height: 90,
          child: ListView.builder(
            padding: const EdgeInsets.only(right: 16, left: 24),
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
