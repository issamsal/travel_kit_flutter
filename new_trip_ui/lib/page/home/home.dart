import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/page/Feed/chat_page.dart';
import 'package:new_trip_ui/page/explore/explore_screen.dart';
import 'package:new_trip_ui/page/location/location_page.dart';
import 'package:new_trip_ui/page/profile/profile_screen.dart';
import 'package:new_trip_ui/page/setting/setting_screen.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/models/enum.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/clipper.dart';

class HomeScreen extends StatefulWidget {
  final AnimationController? animationController;

  const HomeScreen({Key? key, this.animationController}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  BottomBarType bottomBarType = BottomBarType.explore;

  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    _animationController?.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 24.0,
                    right: 24.0,
                    top: MediaQuery.of(context).padding.top + 8.0,
                    bottom: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    bottomBarType == BottomBarType.explore
                        ? Text(
                            Loc.alized.explore_text,
                            style: TextStyles(context).getTitleStyle(),
                          )
                        : bottomBarType == BottomBarType.feed
                            ? Text(
                                Loc.alized.chat_text,
                                style: TextStyles(context).getTitleStyle(),
                              )
                            : bottomBarType == BottomBarType.profile
                                ? Text(
                                    Loc.alized.profile_text,
                                    style: TextStyles(context).getTitleStyle(),
                                  )
                                : Text(
                                    Loc.alized.setting_text,
                                    style: TextStyles(context).getTitleStyle(),
                                  ),
                  ],
                ),
              ),
              Expanded(
                child: bottomBarType == BottomBarType.explore
                    ? ExploreScreen(
                        animationController: _animationController!,
                      )
                    : bottomBarType == BottomBarType.feed
                        ? ChatPage(
                            animationController: _animationController!,
                          )
                        : bottomBarType == BottomBarType.profile
                            ? ProfileScreen(
                                animationController: _animationController!,
                              )
                            : bottomBarType == BottomBarType.setting
                                ? SeetingScreen(
                                    animationController: _animationController!,
                                  )
                                : const SizedBox(),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            height: MediaQuery.of(context).size.height,
            child: _getBottomBarType(),
          ),
        ],
      ),
    );
  }

  Widget _getBottomBarType() {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        PhysicalShape(
          color: AppTheme.backgroundColor,
          shadowColor: AppTheme.whiteTextColor,
          elevation: 16.0,
          clipper: TabClipper(radius: 38.0),
          child: Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            child: SizedBox(
              height: 62,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8.0, top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _getOnSelectBottomBarType(BottomBarType.explore),
                    _getOnSelectBottomBarType(BottomBarType.feed),
                    const SizedBox(
                      width: 48,
                    ),
                    _getOnSelectBottomBarType(BottomBarType.setting),
                    _getOnSelectBottomBarType(BottomBarType.profile),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).padding.bottom + 32,
          child: SizedBox(
            width: 62,
            height: 62,
            child: _getPageRouteBulider(),
          ),
        )
      ],
    );
  }

  Widget _getOnSelectBottomBarType(BottomBarType type) {
    return InkWell(
      onTap: () {
        _animationController?.reverse().then((value) {
          setState(() {
            bottomBarType = type;
            _animationController = AnimationController(
                vsync: this, duration: const Duration(milliseconds: 450));
            _animationController?.forward();
          });
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            type == BottomBarType.explore
                ? Icons.home
                : type == BottomBarType.feed
                    ? Icons.chat
                    : type == BottomBarType.profile
                        ? Icons.person
                        : type == BottomBarType.setting
                            ? Icons.settings
                            : Icons.add,
            size: 28,
            color: bottomBarType == type
                ? AppTheme.primaryColor
                : AppTheme.lightTextColor,
          ),
        ],
      ),
    );
  }

  Widget _getPageRouteBulider() {
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 700),
      transitionType: ContainerTransitionType.fade,
      openBuilder: (BuildContext context, VoidCallback _) {
        return const LocationPage();
      },
      closedColor: AppTheme.primaryColor,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(48.0),
      ),
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Material(
              color: Colors.transparent,
              child: Icon(
                Icons.flight_rounded,
                color: AppTheme.whiteColor,
                size: 32,
              ),
            ),
          ),
        );
      },
    );
  }
}