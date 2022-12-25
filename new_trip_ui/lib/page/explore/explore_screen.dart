import 'package:flutter/material.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/models/explor_list_data.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/page/explore/category_view.dart';
import 'package:new_trip_ui/page/explore/country_screen.dart';
import 'package:new_trip_ui/page/explore/culture_screen.dart';
import 'package:new_trip_ui/routes/navigator.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/bottom_bar_animation.dart';

class ExploreScreen extends StatefulWidget {
  final AnimationController animationController;
  const ExploreScreen({Key? key, required this.animationController})
      : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with TickerProviderStateMixin {
  final tabList = ['Culture', 'Country', 'Category'];
  var getCategory = ExploreData.getCategoryDataList;
  var getPopularView = ExploreData.getPopularDataList;
  var getMostVisitedView = ExploreData.getMostVisitedView;
  var getcultureDetails = CultureData.getCultureDetails;
  var getCountryDetails = CultureData.getCultureDetails;
  TabController? controllerTab;

  @override
  void initState() {
    controllerTab = TabController(initialIndex: 0, length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomBarAnimation(
      animationController: widget.animationController,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                controller: controllerTab,
                unselectedLabelColor: AppTheme.lightTextColor,
                labelColor: AppTheme.primaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: AppTheme.primaryColor,
                onTap: (index) {},
                tabs: [
                  for (var i = 0; i < tabList.length; i++)
                    Tab(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                        ),
                        child: Text(
                          tabList[i] == 'Culture'
                              ? Loc.alized.culture
                              : tabList[i] == 'Country'
                                  ? Loc.alized.country
                                  : tabList[i] == 'Category'
                                      ? Loc.alized.category
                                      : '',
                          style: TextStyles(context).getRegularStyle(),
                        ),
                      ),
                    )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 8.0),
                child: Divider(
                  height: 1,
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: controllerTab,
              children: [
                _getCultureUi(),
                _getCountryUi(),
                _getCategoryUi(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getCultureUi() {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: ListView.builder(
        itemCount: getcultureDetails.length,
        padding:
            EdgeInsets.only(bottom: 68 + MediaQuery.of(context).padding.bottom),
        itemBuilder: (BuildContext text, int index) {
          return CultureScreen(
            getcultureDetails: getcultureDetails[index],
            onTap: () {
              NavigationServices()
                  .gotoCulutureDetailsPage(getcultureDetails[index].titleText);
            },
          );
        },
      ),
    );
  }

  Widget _getCategoryUi() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding:
          EdgeInsets.only(bottom: 68 + MediaQuery.of(context).padding.bottom),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 8, bottom: 8.0),
                child: Text(
                  Loc.alized.category,
                  style: TextStyles(context)
                      .getBoldStyle()
                      .copyWith(color: AppTheme.primaryTextColor, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 0, bottom: 0),
                  scrollDirection: Axis.horizontal,
                  itemCount: getCategory.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return CategoryView(
                      categoryDetails: getCategory[index],
                      index: index,
                      length: getCategory.length,
                    );
                  },
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 24, bottom: 8.0, left: 24, right: 24),
                child: Text(
                  Loc.alized.popular_text,
                  style: TextStyles(context)
                      .getBoldStyle()
                      .copyWith(color: AppTheme.primaryTextColor, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 0, bottom: 0),
                  scrollDirection: Axis.horizontal,
                  itemCount: getPopularView.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return CategoryView(
                      categoryDetails: getPopularView[index],
                      index: index,
                      length: getPopularView.length,
                      onTap: () {
                        NavigationServices().gotoCategoryDetailsPage(
                            getPopularView[index].title);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 24, bottom: 8.0, left: 24, right: 24),
                child: Text(
                  Loc.alized.most_visited,
                  style: TextStyles(context)
                      .getBoldStyle()
                      .copyWith(color: AppTheme.primaryTextColor, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 0, bottom: 0),
                  scrollDirection: Axis.horizontal,
                  itemCount: getMostVisitedView.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return CategoryView(
                      categoryDetails: getMostVisitedView[index],
                      index: index,
                      length: 5,
                      onTap: () {
                        NavigationServices().gotoCategoryDetailsPage(
                            getMostVisitedView[index].title);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getCountryUi() {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.74,
        padding: EdgeInsets.only(
            top: 16, bottom: 68 + MediaQuery.of(context).padding.bottom),
        children: List.generate(
          getCountryDetails.length,
          (index) {
            return CountryPage(
                cultureData: getcultureDetails[index],
                length: getcultureDetails.length,
                index: index);
          },
        ),
      ),
    );
  }
}
//
