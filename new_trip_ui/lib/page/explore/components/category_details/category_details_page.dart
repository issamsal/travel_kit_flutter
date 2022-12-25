import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/models/culture_details_data.dart';
import 'package:new_trip_ui/page/explore/components/category_details/category_galley_view.dart';
import 'package:new_trip_ui/page/explore/components/category_details/category_title.dart';
import 'package:new_trip_ui/page/explore/components/category_details/hotel_view/hotel_list_view.dart';
import 'package:new_trip_ui/page/explore/components/category_details/time_duration_view.dart';
import 'package:new_trip_ui/page/explore/components/culuture_details/review_view.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/card_view.dart';
import 'package:new_trip_ui/widgets/custom_button.dart';

class CategoryDetailsPage extends StatefulWidget {
  final String title;
  const CategoryDetailsPage({Key? key, required this.title}) : super(key: key);

  @override
  State<CategoryDetailsPage> createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage>
    with TickerProviderStateMixin {
  CultureDetailsData? cultureDetailsData;
  bool isSelected = false;
  AnimationController? animationController;
  @override
  void initState() {
    cultureDetailsData = getCulture(widget.title);
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animationController!.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController!,
        builder: (context, child) {
          return Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: 300,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(24.0),
                          bottomRight: Radius.circular(24.0),
                        ),
                        child: SizedBox(
                          height: 260,
                          child: Image.asset(
                            cultureDetailsData!.imageName,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).padding.top + 8,
                        left: 24,
                        child: _getAppbarUI(),
                      ),
                      Positioned(
                        bottom: 4,
                        left: 24,
                        right: 24,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CategorytitleView(
                              cultureDetailsData: cultureDetailsData!,
                              animationController: animationController!,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: FadeTransition(
                    opacity: Tween(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: animationController!,
                            curve: Curves.fastOutSlowIn)),
                    child: Transform(
                      transform: Matrix4.translationValues(
                          0, 40 * (1 - animationController!.value), 0),
                      child: ListView(
                        padding: const EdgeInsets.only(top: 8),
                        children: [
                          const TimeDurationView(),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, top: 16.0, bottom: 8),
                            child: Text(
                              Loc.alized.gallery_text,
                              style: TextStyles(context)
                                  .getBoldStyle()
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, bottom: 8),
                            child: CategoryGalleryView(
                                cultureDetailsData: cultureDetailsData!,
                                animationController: animationController!),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, top: 8.0, bottom: 8),
                            child: Text(
                              Loc.alized.reviews_text,
                              style: TextStyles(context)
                                  .getBoldStyle()
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                                left: 24.0, right: 24.0, bottom: 8, top: 4),
                            child: ReviewView(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, top: 8.0, bottom: 8),
                            child: Text(
                              Loc.alized.hotel_text,
                              style: TextStyles(context)
                                  .getBoldStyle()
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 16, top: 4),
                            child: HotelListView(
                              cultureDetailsData: cultureDetailsData!,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, bottom: 8, left: 24, right: 24),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: CustomButton(
                                    radius: 48,
                                    onTap: () {},
                                    textWidget: CustomButtonText(
                                        text: Loc.alized.book_now_text,
                                        textcolor: AppTheme.whiteColor),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _getAppbarUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardView(
          radius: 8,
          elevation: 0,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
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
      ],
    );
  }

  CultureDetailsData? getCulture(String name) {
    CultureDetailsData? cultureDetailsData;
    if (name == 'Maldives') {
      cultureDetailsData = CategoryDetailList.getCategoryDataList[0];
    } else if (name == 'Dubai') {
      cultureDetailsData = CategoryDetailList.getCategoryDataList[1];
    } else if (name == 'Paris') {
      cultureDetailsData = CategoryDetailList.getCategoryDataList[2];
    } else if (name == 'Thailand') {
      cultureDetailsData = CategoryDetailList.getCategoryDataList[3];
    }
    return cultureDetailsData;
  }
}
