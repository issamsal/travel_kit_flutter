import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';

import 'package:new_trip_ui/page/setting/components/card_setting.dart';
import 'package:new_trip_ui/page/setting/components/crad_format.dart';

import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/card_view.dart';
import 'package:new_trip_ui/widgets/remove_focuse.dart';

class AddNewCrediCard extends StatefulWidget {
  const AddNewCrediCard({Key? key}) : super(key: key);

  @override
  State<AddNewCrediCard> createState() => _AddNewCrediCardState();
}

class _AddNewCrediCardState extends State<AddNewCrediCard>
    with TickerProviderStateMixin {
  final tabList = ['Card Information', 'Card Setting'];
  TabController? controllerTab;
  @override
  void initState() {
    controllerTab = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RemoveFocuse(
        onClick: () {
          setState(() {
            FocusScope.of(context).requestFocus(FocusNode());
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getAppbarUI(),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 0.0),
              child: SizedBox(
                height: 50,
                child: Column(
                  children: [
                    TabBar(
                      controller: controllerTab,
                      unselectedLabelColor:
                          Theme.of(context).dividerColor.withOpacity(0.4),
                      labelColor: AppTheme.primaryColor,
                      indicatorColor: AppTheme.primaryColor,
                      onTap: (index) {},
                      tabs: [
                        for (var i = 0; i < tabList.length; i++)
                          Tab(
                            child: Center(
                              child: Text(
                                tabList[i] == 'Card information'
                                    ? Loc.alized.card_information
                                    : Loc.alized.card_setting,
                              ),
                            ),
                          ),
                      ],
                      indicatorSize: TabBarIndicatorSize.tab,
                    ),
                    Divider(
                      height: 1,
                      color: AppTheme.lightTextColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
                child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controllerTab,
              children: const [
                CardFormat(),
                CardSetting(),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget _getAppbarUI() {
    return Padding(
      padding: EdgeInsets.only(
          left: 24.0, top: MediaQuery.of(context).padding.top + 8, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardView(
            radius: 8,
            elevation: 0,
            child: InkWell(
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
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              Loc.alized.new_credit_card,
              style: TextStyles(context).getTitleStyle(),
            ),
          )
        ],
      ),
    );
  }
}
