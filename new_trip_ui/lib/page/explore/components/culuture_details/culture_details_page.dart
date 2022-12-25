import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/models/culture_details_data.dart';
import 'package:new_trip_ui/page/explore/components/culuture_details/culuture_title_view.dart';
import 'package:new_trip_ui/page/explore/components/culuture_details/gallery/gallery_image_view.dart';
import 'package:new_trip_ui/page/explore/components/culuture_details/review_view.dart';
import 'package:new_trip_ui/page/explore/components/culuture_details/visit_place/visit_place_view.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/card_view.dart';
import 'package:new_trip_ui/widgets/custom_button.dart';

class CulutureDetailsPage extends StatefulWidget {
  final String title;
  const CulutureDetailsPage({Key? key, required this.title}) : super(key: key);

  @override
  State<CulutureDetailsPage> createState() => _CulutureDetailsPageState();
}

class _CulutureDetailsPageState extends State<CulutureDetailsPage>
    with TickerProviderStateMixin {
  CultureDetailsData? cultureDetailsData;
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animationController?.forward();
    cultureDetailsData = getCulture(widget.title);
  }

  bool isSelected = false;
  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24.0),
                  bottomRight: Radius.circular(24.0),
                ),
                child: SizedBox(
                  height: 300,
                  child: Image.asset(
                    cultureDetailsData!.imageName,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + 8,
                left: 24,
                child: _getAppbarUI(),
              ),
            ],
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: animationController!,
              builder: (context, child) {
                return FadeTransition(
                  opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animationController!,
                      curve: Curves.fastOutSlowIn)),
                  child: Transform(
                    transform: Matrix4.translationValues(
                        0, 40 * (1 - animationController!.value), 0),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 8, bottom: 8),
                          child: CulutretitleView(
                            cultureDetailsData: cultureDetailsData!,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 26.0, right: 24, top: 16, bottom: 2),
                          child: Text(
                            Loc.alized.overview_text,
                            style: TextStyles(context)
                                .getBoldStyle()
                                .copyWith(fontSize: 16, letterSpacing: 0.5),
                          ),
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: animationController!.value,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 26.0, right: 24, top: 8),
                            child: Text(
                              Loc.alized.overview_des,
                              style: TextStyles(context)
                                  .getDescriptionStyle()
                                  .copyWith(letterSpacing: 0.3),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 26.0, right: 24, top: 16, bottom: 4),
                          child: Text(
                            Loc.alized.gallery_text,
                            style: TextStyles(context)
                                .getBoldStyle()
                                .copyWith(fontSize: 16, letterSpacing: 0.5),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8, right: 8, left: 8),
                          child: GalleryImageView(
                              animationController: animationController!,
                              cultureDetailsData: cultureDetailsData!),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 26.0, right: 24, bottom: 4, top: 16),
                          child: Text(
                            Loc.alized.rating_text,
                            style: TextStyles(context)
                                .getBoldStyle()
                                .copyWith(fontSize: 16, letterSpacing: 0.5),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 26.0, right: 24, bottom: 4, top: 4),
                          child: ReviewView(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 26.0, right: 24, top: 16, bottom: 8),
                          child: Text(
                            Loc.alized.place_visit_text,
                            style: TextStyles(context)
                                .getBoldStyle()
                                .copyWith(fontSize: 16, letterSpacing: 0.5),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: VisitPlaceView(
                            cultureDetailsData: cultureDetailsData!,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                            top: 16,
                            bottom: 8 + MediaQuery.of(context).padding.bottom,
                          ),
                          child: CustomButton(
                            radius: 48,
                            onTap: () {},
                            textWidget: CustomButtonText(
                                text: Loc.alized.book_now_text,
                                textcolor: AppTheme.whiteColor),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _getAppbarUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardView(
          radius: 8,
          elevation: 0,
          child: InkWell(
            borderRadius: BorderRadius.circular(8.0),
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
    if (name == 'London') {
      cultureDetailsData = CultureDetailList.getCultureDataList[0];
    } else if (name == 'Dubai') {
      cultureDetailsData = CultureDetailList.getCultureDataList[1];
    } else if (name == 'Paris') {
      cultureDetailsData = CultureDetailList.getCultureDataList[2];
    } else if (name == 'Thailand') {
      cultureDetailsData = CultureDetailList.getCultureDataList[3];
    } else if (name == 'Maldives') {
      cultureDetailsData = CultureDetailList.getCultureDataList[4];
    }
    return cultureDetailsData;
  }
}
