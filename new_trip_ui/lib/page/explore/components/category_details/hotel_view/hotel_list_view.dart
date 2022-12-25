import 'package:flutter/material.dart';
import 'package:new_trip_ui/models/culture_details_data.dart';
import 'package:new_trip_ui/page/explore/components/culuture_details/visit_place/visit_place_view_cell.dart';

class HotelListView extends StatefulWidget {
  final CultureDetailsData cultureDetailsData;
  const HotelListView({
    Key? key,
    required this.cultureDetailsData,
  }) : super(key: key);

  @override
  State<HotelListView> createState() => _HotelListViewState();
}

class _HotelListViewState extends State<HotelListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animationController?.forward();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController!,
      child: Transform(
        transform: Matrix4.translationValues(
            40 * (1 - animationController!.value), 0, 0),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: animationController!.value,
          child: SizedBox(
            height: 100,
            child: ListView.builder(
              padding: const EdgeInsets.only(right: 16, left: 16, bottom: 8),
              itemCount: widget.cultureDetailsData.hotelData.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final palce = widget.cultureDetailsData.hotelData[index];
                return SizedBox(
                    width:
                        ((MediaQuery.of(context).size.width - (16 + 16 + 16)) /
                            1.5),
                    child: VisitPlaceCellView(
                      placeVistData: palce,
                    ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
