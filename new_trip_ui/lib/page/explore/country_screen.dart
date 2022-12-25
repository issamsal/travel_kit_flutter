import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/page/explore/culture_screen.dart';
import 'package:new_trip_ui/routes/navigator.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/card_view.dart';

class CountryPage extends StatefulWidget {
  final CultureData cultureData;
  final int length;
  final int index;
  const CountryPage(
      {Key? key,
      required this.cultureData,
      required this.length,
      required this.index})
      : super(key: key);

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Interval((1 / widget.length) * widget.index, 1.0,
            curve: Curves.fastOutSlowIn),
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
          opacity: _animation!,
          child: Transform(
            transform:
                Matrix4.translationValues(0, 100 * (1 - _animation!.value), 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(16.0),
                onTap: () {
                  NavigationServices()
                      .gotoCountryDetailsPage(widget.cultureData.titleText);
                },
                child: CardView(
                  shadowColor: Colors.transparent,
                  radius: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(
                            widget.cultureData.imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.cultureData.titleText,
                              style: TextStyles(context)
                                  .getRegularStyle()
                                  .copyWith(color: AppTheme.primaryTextColor),
                            ),
                            Icon(
                              Icons.arrow_right_alt,
                              color: AppTheme.primaryColor,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '22 places',
                              style: TextStyles(context)
                                  .getDescriptionStyle()
                                  .copyWith(),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                Loc.alized.explore,
                                style: TextStyles(context)
                                    .getDescriptionStyle()
                                    .copyWith(
                                      fontSize: 10,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// class CountryScreen extends StatelessWidget {
//   final AnimationController animationController;
//   final Animation<double> animation;

//   final CountryDetails getCountryDetails;

//   const CountryScreen(
//       {Key? key,
//       required this.getCountryDetails,
//       required this.animationController,
//       required this.animation})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//         animation: animationController,
//         builder: (context, child) {
//           return FadeTransition(
//             opacity: animation,
//             child: Transform(
//               transform:
//                   Matrix4.translationValues(0, 200 * (1 - animation.value), 0),
//               child: Column(
//                 children: [
//                   ClipRRect(
//                     borderRadius: const BorderRadius.all(Radius.circular(16)),
//                     child: AspectRatio(
//                       aspectRatio: 1,
//                       child: Image.asset(
//                         getCountryDetails.imagePath,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             getCountryDetails.titleText,
//                             style: TextStyless(context).getRegularBoldStyle(),
//                           ),
//                         ),
//                         Text('Explore more',
//                             style: TextStyless(context).getExploreText()),
//                         Icon(
//                           Icons.arrow_right_alt,
//                           color: AppTheme.primaryColor,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }

// class CountryDetails {
//   String titleText;
//   String imagePath;

//   CountryDetails({required this.titleText, required this.imagePath});

//   static List<CountryDetails> getCountryDetails = [
//     CountryDetails(
//       titleText: Loc.alized.tataouine_text,
//       imagePath: LocalFiles.tataouineDesertJpg,
//     ),
//     CountryDetails(
//       titleText: Loc.alized.kapai_text,
//       imagePath: LocalFiles.kapaiJpg,
//     ),
//     CountryDetails(
//       titleText: Loc.alized.kasba_text,
//       imagePath: LocalFiles.kasbaDuJpg,
//     ),
//     CountryDetails(
//       titleText: Loc.alized.thailand_text,
//       imagePath: LocalFiles.thailandJpg,
//     ),
//     CountryDetails(
//       titleText: Loc.alized.thailand_text,
//       imagePath: LocalFiles.skiJpg,
//     ),
//   ];
// }
