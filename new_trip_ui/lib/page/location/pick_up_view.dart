import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/widgets/custom_button.dart';

class PickUpView extends StatefulWidget {
  final VoidCallback onTap;
  const PickUpView({Key? key, required this.onTap}) : super(key: key);

  @override
  State<PickUpView> createState() => _PickUpViewState();
}

class _PickUpViewState extends State<PickUpView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: CustomButton(
        textWidget: CustomButtonText(
            text: Loc.alized.find_hotel_text, textcolor: AppTheme.whiteColor),
        onTap: widget.onTap,
      ),
    );
  }
}
