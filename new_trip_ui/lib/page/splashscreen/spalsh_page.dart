import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/local_files.dart';
import 'package:new_trip_ui/routes/navigator.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/circular_progress.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController? animationController;
  int timeDelay = 1200;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    WidgetsBinding.instance.addPostFrameCallback((_) => _loadNextScreen());

    super.initState();
  }

  Future<void> _loadNextScreen() async {
    animationController?.forward();

    _checkUserStatus();
  }

  Future<void> _checkUserStatus() async {
    await Future<dynamic>.delayed(Duration(milliseconds: timeDelay));

    NavigationServices().gotoIntroductionScreen();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    height: 110,
                    width: 110,
                    child: Image.asset(
                      LocalFiles.appLogo,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'TRIP',
                  style: TextStyles(context).getTitleStyle().copyWith(
                        fontSize: 24,
                        color: const Color(0xFFFF6634),
                      ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 24,
            left: 0,
            right: 0,
            child: const Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CustomCircularProgressView(),
              ),
            ),
          )
          //   SizedBox(
          //     height: MediaQuery.of(context).padding.bottom + 24,
          //   )
        ],
      ),
    );
  }
}
