import 'package:flutter/material.dart';
import 'package:new_trip_ui/page/login/login_screen.dart';
import 'package:new_trip_ui/page/login/sign_up_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LoginAndSingUpPage extends StatefulWidget {
  const LoginAndSingUpPage({Key? key}) : super(key: key);

  @override
  State<LoginAndSingUpPage> createState() => _LoginAndSingUpPageState();
}

class _LoginAndSingUpPageState extends State<LoginAndSingUpPage> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView(
                  onPageChanged: (value) {
                    setState(() {});
                  },
                  controller: pageController,
                  children: const [
                    LogInScreen(),
                    SignUpScreen(),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom + 24.0),
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 2,
                    effect: WormEffect(
                        activeDotColor: Theme.of(context).primaryColor,
                        dotColor: Theme.of(context).dividerColor,
                        dotHeight: 10.0,
                        dotWidth: 10.0,
                        spacing: 5.0),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
