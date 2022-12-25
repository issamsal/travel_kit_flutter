import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';

import 'package:new_trip_ui/page/setting/components/common_card_view.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/card_view.dart';

class CardSetting extends StatefulWidget {
  const CardSetting({Key? key}) : super(key: key);

  @override
  State<CardSetting> createState() => _CardSettingState();
}

class _CardSettingState extends State<CardSetting> {
  bool isSave = false;
  bool isRestriction = false;
  bool isbypass = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Text(
              Loc.alized.card_setting,
              style: TextStyles(context).getBoldStyle().copyWith(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 24.0, right: 24.0, top: 8, bottom: 8),
            child: CommonCadView(
              title: Loc.alized.save_card_text,
              padding: const EdgeInsets.all(10),
              leftWidget: CommonSwitch(
                  isValue: isSave,
                  onChaged: (d) {
                    setState(() {
                      isSave = d;
                    });
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 24.0, right: 24.0, top: 8, bottom: 8),
            child: CommonCadView(
              title: Loc.alized.shipping_address,
              leftWidget: CardButtonView(onTap: () {}),
              padding: const EdgeInsets.all(12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 24.0, right: 24.0, top: 8, bottom: 8),
            child: CommonCadView(
              title: Loc.alized.restriction,
              padding: const EdgeInsets.all(10),
              leftWidget: CommonSwitch(
                  isValue: isRestriction,
                  onChaged: (d) {
                    setState(() {
                      isRestriction = d;
                    });
                  }),
            ),
          ),
          if (isRestriction)
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Loc.alized.enable_text,
                    style: TextStyles(context).getDescriptionStyle().copyWith(),
                  ),
                  _getRestrictionAmount(),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: CommonCadView(
                      title: Loc.alized.by_pass_restriction,
                      padding: const EdgeInsets.all(10),
                      leftWidget: CommonSwitch(
                          isValue: isbypass,
                          onChaged: (d) {
                            setState(() {
                              isbypass = d;
                            });
                          }),
                    ),
                  ),
                  Text(
                    Loc.alized.descriptin_text,
                    style: TextStyles(context).getDescriptionStyle().copyWith(),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }

  Widget _getRestrictionAmount() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: CardView(
        radius: 8,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                                  Loc.alized.amount_text,

                style: TextStyles(context).getRegularStyle(),
              ),
              Row(
                children: [
                  Text(
                    '300\$',
                    style: TextStyles(context).getDescriptionStyle().copyWith(),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: AppTheme.primaryColor,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
