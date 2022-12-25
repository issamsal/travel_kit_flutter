import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/page/setting/general_setting_page.dart';
import 'package:new_trip_ui/page/setting/payment_screen.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/bottom_bar_animation.dart';

class SeetingScreen extends StatefulWidget {
  final AnimationController animationController;
  const SeetingScreen({Key? key, required this.animationController})
      : super(key: key);

  @override
  State<SeetingScreen> createState() => _SeetingScreenState();
}

class _SeetingScreenState extends State<SeetingScreen>
    with TickerProviderStateMixin {
  TabController? controllerTab;
  bool isSwitched = false;
  @override
  void initState() {
    controllerTab = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabList = ['General', 'Payment'];

    return BottomBarAnimation(
      animationController: widget.animationController,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                TabBar(
                  controller: controllerTab,
                  unselectedLabelColor: AppTheme.lightTextColor,
                  labelColor: AppTheme.primaryColor,
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
                            tabList[i] == 'General'
                                ? Loc.alized.general_text
                                : tabList[i] == 'Payment'
                                    ? Loc.alized.payment_text
                                    : '',
                            style: TextStyles(context).getRegularStyle(),
                          ),
                        ),
                      )
                  ],
                ),
                Divider(
                  height: 1,
                  color: AppTheme.lightTextColor,
                ),
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: controllerTab,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              GeneralSettingPage(),
              PaymentScreen(),
            ],
          )),
        ],
      ),
    );
  }
}
