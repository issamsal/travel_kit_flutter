import 'package:flutter/material.dart';
import 'package:new_trip_ui/models/culture_details_data.dart';
import 'package:new_trip_ui/page/explore/components/culuture_details/visit_place/visit_place_view_cell.dart';

class VisitPlaceView extends StatefulWidget {
//   final AnimationController animationController;
  final CultureDetailsData cultureDetailsData;
  const VisitPlaceView(
      {Key? key,
      //   required this.animationController,
      required this.cultureDetailsData})
      : super(key: key);

  @override
  State<VisitPlaceView> createState() => _VisitPlaceViewState();
}

class _VisitPlaceViewState extends State<VisitPlaceView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        padding: const EdgeInsets.only(right: 16, left: 24),
        itemCount: widget.cultureDetailsData.placeVisit.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final palce = widget.cultureDetailsData.placeVisit[index];
          return SizedBox(
            width: ((MediaQuery.of(context).size.width - (16 + 16 + 16)) / 2),
            child: VisitPlaceCellView(
              placeVistData: palce,
            ),
          );
        },
      ),
    );
  }
}
