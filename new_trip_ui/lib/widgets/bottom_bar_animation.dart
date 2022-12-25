import 'package:flutter/material.dart';

class BottomBarAnimation extends StatelessWidget {
  final AnimationController animationController;
  final Widget child;

  const BottomBarAnimation(
      {Key? key, required this.animationController, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: animationController,
          child: Transform(
            transform: Matrix4.translationValues(
                0, 40 * (1 - animationController.value), 0),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
