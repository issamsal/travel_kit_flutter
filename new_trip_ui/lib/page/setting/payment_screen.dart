import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/local_files.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/routes/navigator.dart';
import 'package:new_trip_ui/page/setting/components/common_card_view.dart';
import 'package:new_trip_ui/page/setting/components/transaction_history_cell_view.dart';
import 'package:new_trip_ui/utils/text_styles.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 68 + MediaQuery.of(context).padding.bottom,
              ),
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text(
                  Loc.alized.payment_method_text,
                  style:
                      TextStyles(context).getBoldStyle().copyWith(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    Loc.alized.method_text,
                    style: TextStyles(context).getDescriptionStyle(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: CommonCadView(
                    title: Loc.alized.new_credit_card,
                    padding: const EdgeInsets.all(12),
                    leftWidget: CardButtonView(
                      onTap: () {
                        NavigationServices().gotoAddCreditPage();
                      },
                    ),
                  ),
                ),
                _cardUI(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: CommonCadView(
                    title: Loc.alized.paypal_address,
                    padding: const EdgeInsets.all(12),
                    leftWidget: CardButtonView(
                      onTap: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    Loc.alized.tansaction_history,
                    style: TextStyles(context)
                        .getBoldStyle()
                        .copyWith(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    Loc.alized.transaction_text,
                    style: TextStyles(context).getDescriptionStyle(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    Loc.alized.payment_history,
                    style: TextStyles(context)
                        .getBoldStyle()
                        .copyWith(fontSize: 16),
                  ),
                ),
                const TansactionHistoryCellView(),
                const TansactionHistoryCellView(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: CommonCadView(
                      title: Loc.alized.fill_mode,
                      padding: const EdgeInsets.all(10),
                      leftWidget: CommonSwitch(
                          isValue: isSwitched,
                          onChaged: (d) {
                            setState(() {
                              isSwitched = d;
                            });
                          })),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: CommonCadView(
                    title: Loc.alized.shipping_address,
                    padding: const EdgeInsets.all(12),
                    leftWidget: CardButtonView(
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: Card(
        elevation: 0,
        color: const Color(0xFF0819CF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {
            // NavigationServices(context).gotoTransactionHistory();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LISA S. EARLEY',
                  style: TextStyles(context)
                      .getRegularStyle()
                      .copyWith(color: AppTheme.whiteColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          for (var i = 0; i < 12; i++)
                            Row(
                              children: [
                                Icon(Icons.circle,
                                    size: 8, color: AppTheme.whiteColor),
                                if (i == 3 || i == 7 || i == 11)
                                  const SizedBox(
                                    width: 8,
                                  ),
                              ],
                            ),
                          Text(
                            '5467',
                            style: TextStyles(context)
                                .getDescriptionStyle()
                                .copyWith(color: AppTheme.whiteColor),
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          LocalFiles.masterCardPng,
                          height: 18,
                          fit: BoxFit.cover,
                          width: 28,
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  '03/21',
                  style: TextStyles(context)
                      .getDescriptionStyle()
                      .copyWith(color: AppTheme.whiteColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
