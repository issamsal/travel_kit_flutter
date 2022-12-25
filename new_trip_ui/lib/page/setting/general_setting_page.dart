import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/logic/providers/theme_provider.dart';
import 'package:new_trip_ui/models/enum.dart';
import 'package:new_trip_ui/models/setting_list_data.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/card_view.dart';

class GeneralSettingPage extends StatefulWidget {
  const GeneralSettingPage({Key? key}) : super(key: key);

  @override
  State<GeneralSettingPage> createState() => _GeneralSettingPageState();
}

class _GeneralSettingPageState extends State<GeneralSettingPage> {
  List<SettingsListData> userSettingsList = SettingsListData.settingsList();
  List<String> data = ["English", "Germany", "Arabic"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Loc>(builder: (controller) {
      return GetBuilder<ThemeController>(builder: (themController) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(
                      top: 16.0,
                      left: 24,
                      right: 16,
                      bottom: 68 + MediaQuery.of(context).padding.bottom),
                  itemCount: userSettingsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: CardView(
                        radius: 8,
                        elevation: 0,
                        child: InkWell(
                          onTap: () async {
                            if (index == 2) {
                              _getLanguageUI(controller);
                            }
                            if (index == 3) {
                              _getFontPopUI(themController);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  userSettingsList[index].titleTxt,
                                  style: TextStyles(context).getRegularStyle(),
                                ),
                                index == 1
                                    ? _themeUI()
                                    : Icon(userSettingsList[index].iconData,
                                        color: AppTheme.secondaryTextColor
                                            .withOpacity(0.7))
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      });
    });
  }

  Widget _themeUI() {
    final themeProvider = Get.find<ThemeController>();
    return PopupMenuButton<ThemeModeType>(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onSelected: (type) {
        type == ThemeModeType.system
            ? themeProvider.updateThemeMode(ThemeModeType.system)
            : type == ThemeModeType.light
                ? themeProvider.updateThemeMode(ThemeModeType.light)
                : themeProvider.updateThemeMode(ThemeModeType.dark);
        setState(() {});
      },
      offset: const Offset(10, 18),
      itemBuilder: (context) => [
        ...ThemeModeType.values.toList().map(
              (e) => PopupMenuItem(
                value: e,
                child: _getSelectedUI(
                  e == ThemeModeType.system
                      ? FontAwesomeIcons.circleHalfStroke
                      : e == ThemeModeType.light
                          ? FontAwesomeIcons.cloudSun
                          : FontAwesomeIcons.cloudMoon,
                  e == ThemeModeType.system
                      ? Loc.alized.system
                      : e == ThemeModeType.light
                          ? Loc.alized.light
                          : Loc.alized.dark,
                  e == themeProvider.themeModeType,
                ),
              ),
            ),
      ],
      child: Icon(
          themeProvider.themeModeType == ThemeModeType.system
              ? FontAwesomeIcons.circleHalfStroke
              : themeProvider.themeModeType == ThemeModeType.light
                  ? FontAwesomeIcons.cloudSun
                  : FontAwesomeIcons.cloudMoon,
          color: AppTheme.secondaryTextColor),
    );
  }

  Widget _getSelectedUI(IconData icon, String text, bool isCurrent) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color:
                isCurrent ? AppTheme.primaryColor : AppTheme.primaryTextColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              text,
              style: TextStyles(context).getRegularStyle().copyWith(
                    color: isCurrent
                        ? AppTheme.primaryColor
                        : AppTheme.primaryTextColor,
                  ),
            ),
          )
        ],
      ),
    );
  }

  _getLanguageUI(Loc controller) {
    final List<Widget> languageArray = [];
    final list = LanguageType.values.toList();

    for (var element in list) {
      languageArray.add(
        InkWell(
          splashColor: Colors.transparent,
          onTap: () async {
            await controller.localeLanguage(Locale(element.name));
            userSettingsList = SettingsListData.settingsList();
            // controller.update();
            Navigator.pop(Get.context!);
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, bottom: 16, top: 16, right: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                controller.locale.languageCode == element.name
                    ? const Icon(Icons.radio_button_checked)
                    : const Icon(Icons.radio_button_off),
                Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Text(data[element.index]))
              ],
            ),
          ),
        ),
      );
    }
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 240,
            child: CardView(
              color: AppTheme.backgroundColor,
              radius: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                    child: Text(
                      Loc.alized.selected_language,
                      style: TextStyles(context)
                          .getBoldStyle()
                          .copyWith(fontSize: 22),
                    ),
                  ),
                  const Divider(
                    height: 16,
                  ),
                  for (var item in languageArray) item,
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getFontPopUI(ThemeController themeProvider) {
    final List<Widget> fontArray = [];
    FontFamilyType.values.toList().forEach(
      (element) {
        fontArray.add(
          Expanded(
            child: InkWell(
              splashColor: Colors.transparent,
              borderRadius: BorderRadius.circular(8.0),
              onTap: () async {
                await themeProvider.updateFontType(element);
                Navigator.pop(Get.context!);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hello',
                      style: AppTheme.getTextStyle(
                        element,
                        TextStyles(context).getRegularStyle().copyWith(
                            color: themeProvider.fontType == element
                                ? AppTheme.primaryColor
                                : AppTheme.primaryTextColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: FontFamilyType.workSans == element ? 3 : 0),
                      child: Text(
                        element.toString().split('.')[1],
                        style: TextStyles(context).getRegularStyle().copyWith(
                            fontSize: 10,
                            color: themeProvider.fontType == element
                                ? AppTheme.primaryColor
                                : AppTheme.primaryTextColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: CardView(
                    elevation: 0,
                    color: AppTheme.backgroundColor,
                    radius: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            'Selected Fonts',
                            style: TextStyles(context)
                                .getBoldStyle()
                                .copyWith(fontSize: 22),
                          ),
                        ),
                        const Divider(
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  fontArray[0],
                                  fontArray[1],
                                  fontArray[2],
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  fontArray[3],
                                  fontArray[4],
                                  fontArray[5],
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ));
  }
}
