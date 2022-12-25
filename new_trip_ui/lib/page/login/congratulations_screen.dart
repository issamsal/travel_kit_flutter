import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/gradient_text.dart';
import 'package:new_trip_ui/widgets/remove_focuse.dart';

import '../../routes/navigator.dart';
import '../../widgets/card_view.dart';
import '../../widgets/custom_button.dart';

class CongratulationsScreen extends StatefulWidget {
  const CongratulationsScreen({Key? key}) : super(key: key);

  @override
  State<CongratulationsScreen> createState() => _CongratulationsScreenState();
}

class _CongratulationsScreenState extends State<CongratulationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RemoveFocuse(
        onClick: () {
          setState(() {
            FocusScope.of(context).requestFocus(FocusNode());
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getAppbarUI(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 24.0, right: 24.0, top: 8.0, bottom: 8.0),
              child: Text(
                Loc.alized.congratulations_des,
                style: TextStyle(
                  color: AppTheme.lightTextColor,
                  fontSize: 12,
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 8.0,
                  bottom: MediaQuery.of(context).padding.bottom + 16),
              child: CustomButton(
                radius: 24,
                padding: const EdgeInsets.all(0),
                onTap: () {
                  NavigationServices().gotoHomeScreen();
                },
                textWidget: Text(
                  Loc.alized.log_in,
                  style: TextStyles(context)
                      .getRegularStyle()
                      .copyWith(color: AppTheme.whiteColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getAppbarUI() {
    return Padding(
      padding: EdgeInsets.only(
          left: 24.0, top: MediaQuery.of(context).padding.top + 8, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardView(
            radius: 8,
            elevation: 0,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  color: AppTheme.primaryTextColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: GradientText(
              gradient: LinearGradient(colors: AppTheme.regularGradient),
              child: Text(
                Loc.alized.congratulation,
                style: TextStyles(context)
                    .getTitleStyle()
                    .copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
