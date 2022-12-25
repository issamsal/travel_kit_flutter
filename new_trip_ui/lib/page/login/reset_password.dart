import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';

import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/gradient_text.dart';
import 'package:new_trip_ui/widgets/remove_focuse.dart';
import 'package:new_trip_ui/widgets/text_field_view.dart';

import '../../routes/navigator.dart';
import '../../widgets/card_view.dart';
import '../../widgets/custom_button.dart';

class ResetPassWordScreen extends StatefulWidget {
  const ResetPassWordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPassWordScreen> createState() => _ResetPassWordScreenState();
}

class _ResetPassWordScreenState extends State<ResetPassWordScreen> {
  FocusNode newPasswordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  TextEditingController mailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RemoveFocuse(
        onClick: () {
          setState(() {
            FocusScope.of(context).requestFocus(FocusNode());
          });
        },
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getAppbarUI(),
                const SizedBox(
                  height: 16,
                ),
                _getPasswordUI(),
                _getVerifyPasswordtUI(),
                const Expanded(child: SizedBox()),
              ],
            ),
            Positioned(
              left: 24,
              right: 24,
              top: 8.0,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom + 16),
                    child: CustomButton(
                      radius: 24,
                      padding: const EdgeInsets.all(0),
                      onTap: () {
                        NavigationServices().gotoCongratulationsScreen();
                      },
                      textWidget: Text(
                        Loc.alized.reset_text,
                        style: TextStyles(context)
                            .getRegularStyle()
                            .copyWith(color: AppTheme.whiteColor),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getPasswordUI() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 24.0, right: 24.0),
      child: SizedBox(
        child: TextFieldView(
          controller: newPasswordController,
          focusNode: newPasswordFocusNode,
          titleText: Loc.alized.new_password,
          height: 44,
          isObscureText: true,
          contextPadding: const EdgeInsets.only(bottom: 6, left: 8),
          color: Colors.transparent,
          colorBorder: newPasswordFocusNode.hasFocus
              ? AppTheme.primaryColor
              : AppTheme.primaryTextColor.withOpacity(0.1),
          onChanged: (d) {
            setState(() {});
          },
          hintText: Loc.alized.enter_password,
        ),
      ),
    );
  }

  Widget _getVerifyPasswordtUI() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 24.0, right: 24.0),
      child: SizedBox(
        child: TextFieldView(
          controller: newPasswordController,
          focusNode: confirmPasswordFocusNode,
          titleText: Loc.alized.verify_password,
          height: 44,
          isObscureText: true,
          contextPadding: const EdgeInsets.only(bottom: 6, left: 8),
          color: Colors.transparent,
          colorBorder: confirmPasswordFocusNode.hasFocus
              ? AppTheme.primaryColor
              : AppTheme.primaryTextColor.withOpacity(0.1),
          onChanged: (d) {
            setState(() {});
          },
          hintText: Loc.alized.enter_password,
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
            child: GradientText(
              gradient: LinearGradient(colors: AppTheme.regularGradient),
              child: Text(
                Loc.alized.reset_your_password,
                style: TextStyles(context)
                    .getTitleStyle()
                    .copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
