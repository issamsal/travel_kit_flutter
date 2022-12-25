import 'package:flutter/material.dart';

class RemoveFocuse extends StatelessWidget {
  const RemoveFocuse({Key? key, required this.child, required this.onClick})
      : super(key: key);
  final Widget child;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        onClick();
      },
      child: child,
    );
  }
}
