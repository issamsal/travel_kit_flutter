import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/models/culture_details_data.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/card_view.dart';

class CategorytitleView extends StatefulWidget {
  final CultureDetailsData cultureDetailsData;
  final AnimationController animationController;
  const CategorytitleView(
      {Key? key,
      required this.cultureDetailsData,
      required this.animationController})
      : super(key: key);

  @override
  State<CategorytitleView> createState() => _CategorytitleViewState();
}

class _CategorytitleViewState extends State<CategorytitleView>
    with TickerProviderStateMixin {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (context, child) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 1),
          opacity: widget.animationController.value,
          //   opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          //       parent: widget.animationController, curve: Curves.fastOutSlowIn)),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CardView(
                elevation: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8, top: 4),
                            child: Row(
                              children: [
                                Text(
                                  widget.cultureDetailsData.title,
                                  style: TextStyles(context)
                                      .getTitleStyle()
                                      .copyWith(
                                        color: AppTheme.primaryTextColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 6, right: 6, top: 2, bottom: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  color: AppTheme.secondaryTextColor,
                                  size: 18,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 2.0, top: 2),
                                  child: Text(
                                    widget.cultureDetailsData.location,
                                    style: TextStyles(context)
                                        .getDescriptionStyle()
                                        .copyWith(
                                            color: AppTheme.primaryTextColor,
                                            fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8, bottom: 4),
                            child: Row(
                              children: [
                                ratingStar(),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4.0, top: 2),
                                  child: Text(
                                    '4.5',
                                    style: TextStyles(context)
                                        .getDescriptionStyle()
                                        .copyWith(
                                            color: AppTheme.primaryTextColor,
                                            fontSize: 14),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: Container(
                                    height: 14,
                                    width: 1,
                                    color: AppTheme.primaryColor,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.flight,
                                          color: AppTheme.secondaryTextColor,
                                          size: 18,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4.0, top: 2),
                                          child: Text(
                                            "8 ${Loc.alized.fligt_text_d}",
                                            style: TextStyles(context)
                                                .getDescriptionStyle()
                                                .copyWith(
                                                    color: AppTheme
                                                        .primaryTextColor,
                                                    fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 8.0, top: 8, left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$138',
                            style: TextStyles(context).getTitleStyle(),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            '/${Loc.alized.per_person_text}',
                            style: TextStyles(context).getDescriptionStyle(),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // Positioned(
              //   top: -24,
              //   right: languageCode == 'ar'
              //       ? (MediaQuery.of(context).size.width - (24 + 24 + 16))
              //       : 0,
              //   child: ScaleTransition(
              //     scale: widget.animationController,
              //     child: Opacity(
              //       opacity: widget.animationController.value,
              //       child: CardView(
              //         elevation: 0,
              //         radius: 24,
              //         color: AppTheme.primaryColor,
              //         child: InkWell(
              //           borderRadius: BorderRadius.circular(24),
              //           onTap: () {
              //             setState(() {
              //               isSelected = !isSelected;
              //             });
              //           },
              //           child: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Icon(
              //               isSelected
              //                   ? Icons.favorite
              //                   : Icons.favorite_border_rounded,
              //               color: AppTheme.whiteColor,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}

Widget ratingStar() {
  return Row(
    children: [
      for (int i = 0; i < 5; i++)
        Icon(
          Icons.star,
          size: 16,
          color: i == 4 ? AppTheme.secondaryTextColor : Colors.yellow,
        )
    ],
  );
}
