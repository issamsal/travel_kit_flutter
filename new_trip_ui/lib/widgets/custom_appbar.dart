import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';

class CustomAppBarView extends StatelessWidget {
  const CustomAppBarView({
    Key? key,
    this.isAddTopPadding = true,
    this.leftWidget,
    this.rightWidget,
    this.centerWidget,
    this.color,
    this.height,
  }) : super(key: key);

  final bool isAddTopPadding;
  final double? height;
  final Color? color;
  final Widget? leftWidget, rightWidget, centerWidget;

  @override
  Widget build(BuildContext context) {
    final double topPadding =
        isAddTopPadding ? MediaQuery.of(context).padding.top : 0;
    final double finalheight = topPadding +
        ((height == null) ? AppBar().preferredSize.height : height)!.toDouble();
    return Container(
      height: finalheight,
      color: color ?? AppTheme.primaryColor,
      child: Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: Padding(
          padding: const EdgeInsets.only(left: 4, right: 4),
          child: Row(
            children: <Widget>[
              Expanded(
                child: leftWidget != null
                    ? Container(
                        alignment: Alignment.centerLeft,
                        child: leftWidget,
                      )
                    : const SizedBox(),
              ),
              if (centerWidget != null) centerWidget!,
              Expanded(
                child: rightWidget != null
                    ? Container(
                        alignment: Alignment.centerRight,
                        child: rightWidget,
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarTextView extends StatelessWidget {
  const AppBarTextView({Key? key, this.titalText = ''}) : super(key: key);
  final String titalText;

  @override
  Widget build(BuildContext context) {
    return Text(
      titalText,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline6!.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

class AppBarButtonView extends StatelessWidget {
  const AppBarButtonView({
    Key? key,
    this.buttonWidget,
    required this.onTap,
    this.aspectRatio = 1,
    this.padding = 6,
  }) : super(key: key);

  final double aspectRatio, padding;
  final Widget? buttonWidget;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: buttonWidget,
        ),
      ),
    );
  }
}
