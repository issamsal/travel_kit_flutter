import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/models/culture_details_data.dart';
import 'package:new_trip_ui/page/explore/components/culuture_details/gallery/gallery_image_cell_view.dart';
import 'package:new_trip_ui/page/explore/components/culuture_details/review_view.dart';
import 'package:new_trip_ui/page/explore/components/culuture_details/visit_place/visit_place_view.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/card_view.dart';
import 'package:new_trip_ui/widgets/custom_button.dart';

class CountryDetailsPage extends StatefulWidget {
  final String title;
  const CountryDetailsPage({Key? key, required this.title}) : super(key: key);

  @override
  State<CountryDetailsPage> createState() => _CountryDetailsPageState();
}

class _CountryDetailsPageState extends State<CountryDetailsPage>
    with TickerProviderStateMixin {
  TabController? tabController;
  bool isSelected = false;
  CultureDetailsData? cultureDetailsData;
  AnimationController? animationController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    cultureDetailsData = getCulture(widget.title);
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    animationController?.forward();
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  List<String> list = [
    Loc.alized.overview_text,
    Loc.alized.gallery_text,
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (context, child) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  cultureDetailsData!.imageName,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + 8,
                left: 24,
                right: 16,
                child: _getAppbarUI(),
              ),
              Positioned(
                bottom: 0,
                left: 8,
                right: 8,
                child: FadeTransition(
                  opacity: animationController!,
                  child: SizeTransition(
                    sizeFactor: animationController!,
                    child: CardView(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 8),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, right: 8, top: 8),
                                            child: Text(
                                              cultureDetailsData!.title,
                                              style: TextStyles(context)
                                                  .getTitleStyle()
                                                  .copyWith(
                                                      color: AppTheme
                                                          .primaryTextColor,
                                                      fontSize: 28),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 6,
                                                right: 6,
                                                top: 2,
                                                bottom: 8),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.location_pin,
                                                  color: AppTheme
                                                      .secondaryTextColor,
                                                  size: 18,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 2.0, top: 2),
                                                  child: Text(
                                                    cultureDetailsData!
                                                        .location,
                                                    style: TextStyles(context)
                                                        .getDescriptionStyle()
                                                        .copyWith(
                                                            color: AppTheme
                                                                .primaryTextColor,
                                                            fontSize: 14),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4.0,
                                                          right: 4.0),
                                                  child: Container(
                                                    height: 14,
                                                    width: 1,
                                                    color:
                                                        AppTheme.primaryColor,
                                                  ),
                                                ),
                                                ratingStar(),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4.0, top: 2),
                                                  child: Text(
                                                    '4.5',
                                                    style: TextStyles(context)
                                                        .getDescriptionStyle()
                                                        .copyWith(
                                                            color: AppTheme
                                                                .primaryTextColor,
                                                            fontSize: 14),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8.0, top: 4),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '\$138',
                                              style: TextStyles(context)
                                                  .getTitleStyle(),
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              '/${Loc.alized.per_person_text}',
                                              style: TextStyles(context)
                                                  .getDescriptionStyle(),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Divider(
                                    height: 1,
                                    color: AppTheme.secondaryTextColor,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16, left: 8, right: 8),
                              child: TabBar(
                                isScrollable: true,
                                controller: tabController,
                                padding: EdgeInsets.zero,
                                indicatorColor: AppTheme.primaryColor,
                                indicatorSize: TabBarIndicatorSize.label,
                                tabs: [
                                  for (int i = 0; i < 2; i++)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0,
                                          right: 0,
                                          top: 8.0,
                                          bottom: 8),
                                      child: Text(
                                        list[i],
                                        style: TextStyles(context)
                                            .getBoldStyle()
                                            .copyWith(fontSize: 16),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 234,
                              child: TabBarView(
                                controller: tabController,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24.0,
                                        right: 24,
                                        top: 8,
                                        bottom: 8),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: Text(
                                            Loc.alized.overview_des,
                                            style: TextStyles(context)
                                                .getDescriptionStyle()
                                                .copyWith(letterSpacing: 0.3),
                                          ),
                                        ),
                                        const ReviewView()
                                      ],
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 24.0, right: 16.0, top: 8),
                                      child: GridView.builder(
                                          padding: EdgeInsets.zero,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: cultureDetailsData!
                                              .gallery.length,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  mainAxisSpacing: 8.0,
                                                  childAspectRatio: 1),
                                          itemBuilder:
                                              (BuildContext context, index) {
                                            return GalleryimageCellView(
                                                imageName: cultureDetailsData!
                                                    .gallery[index]);
                                          })),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, top: 16.0, bottom: 16),
                              child: Text(
                                Loc.alized.place_visit_text,
                                style: TextStyles(context)
                                    .getBoldStyle()
                                    .copyWith(fontSize: 16),
                              ),
                            ),
                            VisitPlaceView(
                              cultureDetailsData: cultureDetailsData!,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 24.0,
                                  right: 24,
                                  bottom:
                                      8 + MediaQuery.of(context).padding.bottom,
                                  top: 16),
                              child: CustomButton(
                                radius: 24,
                                onTap: () {},
                                textWidget: CustomButtonText(
                                    text: Loc.alized.book_now_text,
                                    textcolor: AppTheme.whiteColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
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
