import 'package:flutter/material.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/utils/text_styles.dart';

class TimeDurationView extends StatefulWidget {
  const TimeDurationView({Key? key}) : super(key: key);

  @override
  State<TimeDurationView> createState() => _TimeDurationViewState();
}

class _TimeDurationViewState extends State<TimeDurationView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 8.0, bottom: 8),
          child: Text(
            Loc.alized.overview_text,
            style: TextStyles(context).getBoldStyle().copyWith(fontSize: 16),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 0, bottom: 4),
          child: Text(
            Loc.alized.des_text,
            style: TextStyles(context).getDescriptionStyle(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _getComponentUI(
                '5 ${Loc.alized.daya}',
                Loc.alized.duration,
                const Icon(
                  Icons.schedule,
                  color: Colors.blue,
                ),
              ),
              _getComponentUI(
                '625 ${Loc.alized.km}',
                Loc.alized.distance_text,
                const Icon(
                  Icons.location_pin,
                  color: Colors.red,
                ),
              ),
              _getComponentUI(
                "25 'c",
                Loc.alized.sunny_text,
                const Icon(
                  Icons.sunny,
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getComponentUI(String title, String des, Icon icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        icon,
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    TextStyles(context).getBoldStyle().copyWith(fontSize: 16),
              ),
              Text(
                des,
                style: TextStyles(context).getDescriptionStyle(),
              )
            ],
          ),
        )
      ],
    );
  }
}
