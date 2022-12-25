import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';

import 'package:new_trip_ui/models/page_view_data.dart';
import 'package:new_trip_ui/page/splashscreen/pagepopup.dart';
import 'package:new_trip_ui/routes/navigator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/text_styles.dart';
import '../../widgets/custom_button.dart';

class IntroductionScreen extends StatefulWidget {
  final bool isShowButton;

  const IntroductionScreen({Key? key, this.isShowButton = false})
      : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  var pageController = PageController(initialPage: 0);

  late Timer sliderTimer;
  var currentShowIndex = 0;

  List<PageViewData> pageViewModelData = PageViewData.getIntroduction;
  @override
  void initState() {
    super.initState();
    sliderTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (currentShowIndex == 0) {
        pageController.animateTo(MediaQuery.of(context).size.width,
            duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 1) {
        pageController.animateTo(MediaQuery.of(context).size.width * 2,
            duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 2) {
        pageController.animateTo(0,
            duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      }
    });
  }

  @override
  void dispose() {
    sliderTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              pageSnapping: true,
              onPageChanged: (index) {
                setState(() {
                  currentShowIndex = index;
                });
              },
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                for (var i = 0; i < pageViewModelData.length; i++)
                  PagePopup(
                    imageData: pageViewModelData[i],
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SmoothPageIndicator(
              controller: pageController, // PageController
              count: 3,
              effect: WormEffect(
                  activeDotColor: Theme.of(context).primaryColor,
                  dotColor: Theme.of(context).dividerColor,
                  dotHeight: 10.0,
                  dotWidth: 10.0,
                  spacing: 5.0), // your preferred effect
              onDotClicked: (index) {},
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: MediaQuery.of(context).padding.bottom + 16),
            child: CustomButton(
              radius: 24,
              padding: const EdgeInsets.all(0),
              onTap: () {
                NavigationServices().gotoLoginAndSingUpPage();
              },
              textWidget: Text(
                Loc.alized.get_started,
                style: TextStyles(context)
                    .getRegularStyle()
                    .copyWith(color: AppTheme.whiteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
