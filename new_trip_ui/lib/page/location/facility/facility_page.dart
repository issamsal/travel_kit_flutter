import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/card_view.dart';

class FacilityPage extends StatefulWidget {
  final AnimationController animationController;
  const FacilityPage({Key? key, required this.animationController})
      : super(key: key);

  @override
  State<FacilityPage> createState() => _FacilityPageState();
}

class _FacilityPageState extends State<FacilityPage> {
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: widget.animationController,
      child: Transform(
        transform: Matrix4.translationValues(
            50 * (1 - widget.animationController.value), 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 26.0, right: 24, top: 4),
              child: Text(
                Loc.alized.facility_text,
                style: TextStyles(context)
                    .getBoldStyle()
                    .copyWith(fontSize: 16, letterSpacing: 0.5),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _getFacilityUI(
                    Loc.alized.wifi_text,
                    Icons.wifi,
                    Colors.pink,
                  ),
                  _getFacilityUI(
                    Loc.alized.ac_text,
                    Icons.heat_pump_outlined,
                    const Color(0xFF47A3ED),
                  ),
                  _getFacilityUI(
                    Loc.alized.resaturant_text,
                    Icons.restaurant_menu_rounded,
                    const Color(0xFFF6B73C),
                  ),
                  _getFacilityUI(
                    Loc.alized.bath_text,
                    Icons.bathtub_outlined,
                    const Color(0xFF3062E5),
                  ),
                  _getFacilityUI(
                    Loc.alized.parking_text,
                    Icons.local_parking_rounded,
                    AppTheme.primaryColor,
                  ),
                  _getFacilityUI(
                    Loc.alized.gym_text,
                    Icons.fitness_center_outlined,
                    const Color(0xFF6B8B29),
                  ),
                  _getFacilityUI(
                    Loc.alized.pool_text,
                    Icons.pool_outlined,
                    const Color(0xFF1ACDD6),
                  ),
                  _getFacilityUI(
                    Loc.alized.bar_text,
                    Icons.liquor_outlined,
                    const Color(0xFFC14820),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getFacilityUI(String title, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Column(
        children: [
          CardView(
            elevation: 0,
            borderColor: Colors.transparent,
            color: color.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                size: 28,
                color: color,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              title,
              style: TextStyles(context)
                  .getDescriptionStyle()
                  .copyWith(color: AppTheme.primaryTextColor),
            ),
          ),
        ],
      ),
    );
  }
}
