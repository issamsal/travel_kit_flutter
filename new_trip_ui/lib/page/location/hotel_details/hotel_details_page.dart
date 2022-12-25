import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_trip_ui/constants/local_files.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/models/hotel_list_data.dart';
import 'package:new_trip_ui/page/location/facility/facility_page.dart';
import 'package:new_trip_ui/page/location/hotel_details/hotel_details_title_view.dart';
import 'package:new_trip_ui/page/location/hotel_room/hotel_roome_list.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/card_view.dart';

import '../../../widgets/custom_button.dart';

class HotelDeailsPage extends StatefulWidget {
  final HotelListData hotelListData;
  const HotelDeailsPage({Key? key, required this.hotelListData})
      : super(key: key);

  @override
  State<HotelDeailsPage> createState() => _HotelDeailsPageState();
}

class _HotelDeailsPageState extends State<HotelDeailsPage>
    with TickerProviderStateMixin {
  var hoteltext1 = Loc.alized.descriptin_text_1;
  var hoteltext2 = Loc.alized.descriptin_text_2;
  bool isReadless = false;
  bool isFavourite = false;
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = Get.find<Loc>().locale.languageCode == 'ar';
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24.0),
                  bottomRight: Radius.circular(24.0),
                ),
                child: SizedBox(
                  height: 280,
                  child: PageView(
                    children: [
                      Image.asset(
                        widget.hotelListData.hotelImage,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + 8,
                left: 16,
                right: 16,
                child: _getAppbarUI(),
              ),
            ],
          ),
          Expanded(
            child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: animationController,
                    child: Transform(
                      transform: Matrix4.translationValues(
                          0, 50 * (1 - animationController.value), 0),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: HotelDetailsTitleView(
                                hotelListData: widget.hotelListData),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 26.0, right: 24, top: 8),
                            child: Text(
                              Loc.alized.descriptin_text,
                              style: TextStyles(context)
                                  .getBoldStyle()
                                  .copyWith(fontSize: 16, letterSpacing: 0.5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, top: 4, bottom: 8),
                            child: RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: !isReadless ? hoteltext1 : hoteltext2,
                                    style: TextStyles(context)
                                        .getDescriptionStyle()
                                        .copyWith(
                                          fontSize: 14,
                                        ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                  ),
                                  TextSpan(
                                    text: !isReadless
                                        ? Loc.alized.read_more_text
                                        : Loc.alized.less_text,
                                    style: TextStyles(context)
                                        .getRegularStyle()
                                        .copyWith(
                                            color: AppTheme.primaryColor,
                                            fontSize: 14),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        setState(() {
                                          isReadless = !isReadless;
                                        });
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, bottom: 8, top: 4),
                            child: CardView(
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ratingStar(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 2.0),
                                          child: Row(
                                            children: [
                                              //   AnimatedBuilder(
                                              //     animation: animationController,
                                              //     builder: (context, child) {
                                              //       return Text(
                                              //         '2.3k ' +
                                              //             Loc.alized.reviews_text,
                                              //         style: TextStyles(context)
                                              //             .getRegularStyle()
                                              //             .copyWith(
                                              //                 color: AppTheme
                                              //                     .secondaryTextColor),
                                              //       );
                                              //     },
                                              //   ),
                                              AnimatedTextKit(
                                                isRepeatingAnimation: false,
                                                animatedTexts: [
                                                  TypewriterAnimatedText(
                                                    '2.3k ${Loc.alized.reviews_text}',
                                                    speed: const Duration(
                                                        milliseconds: 100),
                                                    textStyle: TextStyles(
                                                            context)
                                                        .getRegularStyle()
                                                        .copyWith(
                                                            color: AppTheme
                                                                .secondaryTextColor),
                                                  ),
                                                ],
                                              ),

                                              Icon(
                                                Icons
                                                    .keyboard_arrow_right_rounded,
                                                color:
                                                    AppTheme.secondaryTextColor,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Stack(
                                      clipBehavior: Clip.none,
                                      alignment: Alignment.center,
                                      children: [
                                        _getCircleImage(LocalFiles.avatar2),
                                        Positioned(
                                          top: 0,
                                          left: loc ? 16 : -16,
                                          child: _getCircleImage(
                                              LocalFiles.avatar1),
                                        ),
                                        Positioned(
                                          top: 0,
                                          left: loc ? 32 : -32,
                                          child: _getCircleImage(
                                              LocalFiles.avatar3),
                                        ),
                                        Positioned(
                                          top: 0,
                                          left: loc ? 48 : -48,
                                          child: _getCircleImage(
                                              LocalFiles.avatar4),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 26.0, right: 24, top: 4),
                            child: Text(
                              Loc.alized.photo_text,
                              style: TextStyles(context)
                                  .getBoldStyle()
                                  .copyWith(fontSize: 16, letterSpacing: 0.5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: HotelRoomeList(
                                animationController: animationController),
                          ),
                          FacilityPage(
                            animationController: animationController,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24.0, right: 24.0, top: 16, bottom: 8),
                            child: CustomButton(
                              onTap: () {},
                              textWidget: CustomButtonText(
                                  text: Loc.alized.book_now_text,
                                  textcolor: AppTheme.whiteColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _getAppbarUI() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CardView(
          radius: 8,
          elevation: 0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.keyboard_arrow_left_rounded,
                color: AppTheme.primaryTextColor,
              ),
            ),
          ),
        ),
        CardView(
          radius: 8,
          elevation: 0,
          child: InkWell(
            onTap: () {
              setState(() {
                isFavourite = !isFavourite;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                isFavourite
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                color: isFavourite
                    ? AppTheme.primaryColor
                    : AppTheme.primaryTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getCircleImage(String imageName) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.0),
      child: Image.asset(
        imageName,
        height: 28,
        width: 28,
      ),
    );
  }

  Widget ratingStar() {
    return Row(
      children: [
        for (int i = 0; i < 5; i++)
          const Icon(
            Icons.star,
            size: 16,
            color: Colors.yellow,
          )
      ],
    );
  }
}
