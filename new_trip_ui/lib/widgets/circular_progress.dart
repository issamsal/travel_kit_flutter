import 'package:flutter/material.dart';

class CustomCircularProgressView extends StatefulWidget {
  const CustomCircularProgressView({Key? key}) : super(key: key);

  @override
  State<CustomCircularProgressView> createState() =>
      _CustomCircularProgressViewState();
}

class _CustomCircularProgressViewState extends State<CustomCircularProgressView>
    with TickerProviderStateMixin {
  AnimationController? colorsController;

  @override
  void initState() {
    colorsController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2222));
    colorsController?.repeat();
    super.initState();
  }

  @override
  void dispose() {
    colorsController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorTween = colorsController?.drive(ColorTween(
      begin: Theme.of(context).primaryColor,
      end: Theme.of(context).primaryColor.withOpacity(0.4),
    ));
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor: colorTween,
      ),
    );
  }
}
