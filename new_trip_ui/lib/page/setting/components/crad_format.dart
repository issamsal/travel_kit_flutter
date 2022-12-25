import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';

import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/custom_button.dart';

import 'package:new_trip_ui/widgets/remove_focuse.dart';
import 'package:new_trip_ui/widgets/text_field_view.dart';

class CardFormat extends StatefulWidget {
  const CardFormat({Key? key}) : super(key: key);

  @override
  State<CardFormat> createState() => _CardFormatState();
}

class _CardFormatState extends State<CardFormat> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController cardNumberEditingController = TextEditingController();
  TextEditingController expiryNumberEditingController = TextEditingController();
  TextEditingController cvcEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RemoveFocuse(
        onClick: () {
          setState(() {
            FocusScope.of(context).requestFocus(FocusNode());
          });
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Text(
                  Loc.alized.card_information,
                  style:
                      TextStyles(context).getBoldStyle().copyWith(fontSize: 18),
                ),
              ),
              _getCardNumber(),
              _getHolderName(),
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, bottom: 8.0, top: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFieldView(
                        controller: expiryNumberEditingController,
                        titleText: Loc.alized.expiry,
                        onChanged: (d) {},
                        height: 44,
                        hintText: Loc.alized.expiry,
                        color: Colors.transparent,
                        colorBorder: AppTheme.primaryTextColor.withOpacity(0.1),
                        contextPadding:
                            const EdgeInsets.only(bottom: 6, left: 8),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                          CardExpiryInputFormatter(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFieldView(
                        controller: cvcEditingController,
                        titleText: Loc.alized.cvv,
                        height: 44,
                        contextPadding:
                            const EdgeInsets.only(bottom: 6, left: 8),
                        color: Colors.transparent,
                        colorBorder: AppTheme.primaryTextColor.withOpacity(0.1),
                        onChanged: (d) {},
                        hintText: Loc.alized.cvv,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(3),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 8.0),
                child: CustomButton(
                  radius: 24,
                  padding: const EdgeInsets.all(0),
                  onTap: () {},
                  textWidget: Text(
                    Loc.alized.add_card,
                    style: TextStyles(context)
                        .getRegularStyle()
                        .copyWith(color: AppTheme.primaryTextColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getHolderName() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 8.0),
      child: TextFieldView(
        height: 44,
        contextPadding: const EdgeInsets.only(bottom: 6, left: 8),
        controller: textEditingController,
        titleText: Loc.alized.holder_name,
        hintText: Loc.alized.enter_holder_name,
        color: Colors.transparent,
        colorBorder: AppTheme.primaryTextColor.withOpacity(0.1),
        onChanged: (d) {},
      ),
    );
  }

  Widget _getCardNumber() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 8.0),
      child: TextFieldView(
        controller: cardNumberEditingController,
        titleText: Loc.alized.card_number_text,
        hintText: Loc.alized.enter_card_number_text,
        height: 44,
        contextPadding: const EdgeInsets.only(bottom: 6, left: 8),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(16),
          CardNumberInputFormatter()
        ],
        color: Colors.transparent,
        colorBorder: AppTheme.primaryTextColor.withOpacity(0.1),
        onChanged: (d) {
          setState(() {});
        },
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class CardExpiryInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != text.length) {
        buffer.write('/');
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
