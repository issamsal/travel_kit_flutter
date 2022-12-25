import 'package:flutter/material.dart';

class CommonTextStyle {
  final BuildContext context;

  CommonTextStyle(this.context);

  TextStyle get buttonTextStyle => Theme.of(context)
      .textTheme
      .subtitle1
      !.copyWith(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white);
}
