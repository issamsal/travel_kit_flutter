import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/card_view.dart';
import 'package:new_trip_ui/widgets/custom_button.dart';

class CommonCadView extends StatelessWidget {
  final String title;
  final EdgeInsets? padding;
  final Widget? leftWidget;
  const CommonCadView(
      {Key? key, required this.title, this.padding, this.leftWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardView(
      radius: 8,
      elevation: 0,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyles(context).getRegularStyle(),
            ),
            if (leftWidget != null) leftWidget!
          ],
        ),
      ),
    );
  }
}

class CardButtonView extends StatelessWidget {
  final VoidCallback onTap;
  const CardButtonView({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      borderColor: AppTheme.primaryColor,
      color: Colors.transparent,
      radius: 16,
      height: 24,
      isCenterUI: false,
      padding: const EdgeInsets.all(0),
      onTap: onTap,
      textWidget: Icon(
        Icons.add,
        color: AppTheme.whiteTextColor,
      ),
    );
  }
}

class CommonSwitch extends StatelessWidget {
  final bool isValue;
  final Function(bool) onChaged;
  const CommonSwitch({Key? key, required this.isValue, required this.onChaged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: FittedBox(
        child: CupertinoSwitch(
            value: isValue,
            activeColor: AppTheme.primaryColor,
            onChanged: onChaged),
      ),
    );
  }
}
