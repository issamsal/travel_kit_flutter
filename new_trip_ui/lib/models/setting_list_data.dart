import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';

class SettingsListData {
  String titleTxt;
  String subTxt;
  IconData iconData;
  bool isSelected;

  SettingsListData({
    this.titleTxt = '',
    this.isSelected = false,
    this.subTxt = '',
    this.iconData = Icons.supervised_user_circle,
  });

  static List<SettingsListData> settingsList() => [
        SettingsListData(
          titleTxt: Loc.alized.notifications_text,
          isSelected: false,
          iconData: FontAwesomeIcons.solidBell,
        ),
        SettingsListData(
          titleTxt: Loc.alized.theme_mode,
          isSelected: false,
          iconData: FontAwesomeIcons.skyatlas,
        ),
        SettingsListData(
          titleTxt: Loc.alized.language_text,
          isSelected: false,
          iconData: Icons.translate_outlined,
        ),
        SettingsListData(
          titleTxt: Loc.alized.font_type,
          isSelected: false,
          iconData: Icons.font_download,
        ),
        SettingsListData(
          titleTxt: Loc.alized.country,
          isSelected: false,
          iconData: FontAwesomeIcons.userGroup,
        ),
        SettingsListData(
          titleTxt: Loc.alized.currency_text,
          isSelected: false,
          iconData: FontAwesomeIcons.gift,
        ),
        SettingsListData(
          titleTxt: Loc.alized.terms_of_services,
          isSelected: false,
          iconData: Icons.keyboard_arrow_right,
        ),
        SettingsListData(
          titleTxt: Loc.alized.privacy_policy_text,
          isSelected: false,
          iconData: Icons.keyboard_arrow_right,
        ),
        SettingsListData(
          titleTxt: Loc.alized.give_us_feedback,
          isSelected: false,
          iconData: Icons.keyboard_arrow_right,
        ),
        SettingsListData(
          titleTxt: Loc.alized.log_out,
          isSelected: false,
          iconData: Icons.keyboard_arrow_right,
        )
      ];
}
