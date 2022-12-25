import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/utils/text_styles.dart';

class MostVisitedView extends StatefulWidget {
  final int length;
  final int index;
  final MostVisitedDetails getMostVisitedView;
  const MostVisitedView(
      {Key? key,
      required this.length,
      required this.index,
      required this.getMostVisitedView})
      : super(key: key);

  @override
  State<MostVisitedView> createState() => _MostVisitedViewState();
}

class _MostVisitedViewState extends State<MostVisitedView>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Interval(
          ((1 / widget.length) * widget.index),
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    _animationController?.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController!,
        builder: (context, child) {
          return FadeTransition(
            opacity: animation!,
            child: Transform(
              transform:
                  Matrix4.translationValues(100 * (1 - animation!.value), 0, 0),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                      child: Image.asset(
                        widget.getMostVisitedView.imagePath,
                        height: 150,
                        width: 220,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppTheme.darkTextColor.withOpacity(0.8),
                            AppTheme.darkTextColor.withOpacity(0.4),
                            AppTheme.darkTextColor,
                            AppTheme.darkTextColor,
                          ],
                          end: Alignment.bottomCenter,
                          begin: Alignment.topLeft,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                      child: Text(
                        widget.getMostVisitedView.text,
                        style: TextStyles(context).getRegularStyle(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

// class MostVisitedView extends StatelessWidget {
//   final MostVisitedDetails getMostVisitedView;

//   const MostVisitedView({
//     Key? key,
//     required this.getMostVisitedView,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//         animation: _animationController!,
//         builder: (context, child) {
//           return FadeTransition(
//             opacity: animation!,
//             child: Transform(
//               transform:
//                   Matrix4.translationValues(100 * (1 - animation!.value), 0, 0),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 8.0, right: 8.0),
//                 child: Stack(
//                   children: [
//                     ClipRRect(
//                       borderRadius:
//                           const BorderRadius.all(Radius.circular(16.0)),
//                       child: Image.asset(
//                         widget.categoryDetails.imagePath,
//                         height: 150,
//                         width: 220,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Container(
//                       height: 150,
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [
//                             AppTheme.darkTextColor.withOpacity(0.6),
//                             AppTheme.darkTextColor.withOpacity(0.4),
//                             AppTheme.darkTextColor,
//                             AppTheme.darkTextColor,
//                           ],
//                           end: Alignment.bottomCenter,
//                           begin: Alignment.topLeft,
//                         ),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 8.0, left: 8.0),
//                       child: Text(
//                         widget.categoryDetails.text,
//                         style: TextStyless(context)
//                             .getRegularBoldStyle()
//                             .copyWith(fontSize: 18),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
// }

class MostVisitedDetails {
  String text;
  String imagePath;

  MostVisitedDetails({required this.text, required this.imagePath});

  static List<MostVisitedDetails> getMostVisitedView = [
    MostVisitedDetails(
      text: 'Paris',
      imagePath: 'asset/images/paris.jpg',
    ),
    MostVisitedDetails(
      text: 'Thailand',
      imagePath: 'asset/images/thailand.jpg',
    ),
    MostVisitedDetails(
      text: 'Maldives',
      imagePath: 'asset/images/maldives.jpg',
    ),
    MostVisitedDetails(
      text: 'Burj Khalifa',
      imagePath: 'asset/images/burj.jpg',
    ),
    MostVisitedDetails(
      text: 'Bali',
      imagePath: 'asset/images/bali.jpg',
    ),
  ];
}
