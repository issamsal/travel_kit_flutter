import 'package:flutter/material.dart';
import 'package:new_trip_ui/widgets/tap_effect.dart';
// import 'package:postie/constants/themes.dart';
// import 'package:postie/widgets/tap_effect.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.textWidget,
    this.color,
    required this.onTap,
    this.borderColor = Colors.transparent,
    this.isProcessing = false,
    this.height = 52,
    this.isCenterUI = true,
    this.radius = 8,
    this.isClickable = true,
    this.shadowColor,
    this.padding,
    this.buttoncolor,
  }) : super(key: key);

  final Widget? textWidget;
  final double height, radius;
  final bool isProcessing, isCenterUI, isClickable;
  final Color? color, borderColor, shadowColor;
  final Gradient? buttoncolor;
  final VoidCallback onTap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final buttonColor = buttoncolor ??
        const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0XffFF6699),
              Color(0xffFD9066),
            ]);

    final paddings = padding ?? const EdgeInsets.only(left: 16, right: 16);
    return TapEffect(
      isClickable: isClickable,
      onClick: onTap,
      child: Opacity(
        opacity: isClickable ? 1 : 0.6,
        child: SizedBox(
          height: height,
          child: Container(
            decoration: BoxDecoration(
              gradient: buttonColor,
              borderRadius: BorderRadius.circular(radius),
            ),
            //   color: colorData,
            child: Padding(
              padding: paddings,
              child: Row(
                mainAxisSize: isCenterUI ? MainAxisSize.max : MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isProcessing)
                    const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    ),
                  textWidget!,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonText extends StatelessWidget {
  final String text;
  final Color textcolor;

  const CustomButtonText({
    Key? key,
    this.text = '',
    this.textcolor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.button!.copyWith(
            color: textcolor,
            fontSize: 17,
          ),
    );
  }
}
