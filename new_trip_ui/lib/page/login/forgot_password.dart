import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';

import 'package:new_trip_ui/routes/navigator.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/custom_button.dart';
import 'package:new_trip_ui/widgets/gradient_text.dart';
import 'package:new_trip_ui/widgets/remove_focuse.dart';
import 'package:new_trip_ui/widgets/text_field_view.dart';

import '../../widgets/card_view.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  FocusNode emailFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();
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
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, top: 8.0, bottom: 8.0),
                  child: Text(
                    Loc.alized.forgot_password_des,
                    style: TextStyle(
                      color: AppTheme.lightTextColor,
                      fontSize: 12,
                    ),
                  ),
                ),
                _getMailUI(),
              ],
            ),
            Positioned(
              top: 8.0,
              left: 24,
              right: 24,
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
                        NavigationServices().gotoResetPassWordScreen();
                      },
                      textWidget: Text(
                        Loc.alized.send_text,
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

  Widget _getMailUI() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 4.0, bottom: 8.0, left: 24.0, right: 24.0),
      child: SizedBox(
        child: TextFieldView(
          controller: emailController,
          focusNode: emailFocusNode,
          titleText: Loc.alized.email,
          height: 44,
          contextPadding: const EdgeInsets.only(bottom: 6, left: 8),
          color: Colors.transparent,
          colorBorder: emailFocusNode.hasFocus
              ? AppTheme.primaryColor
              : AppTheme.primaryTextColor.withOpacity(0.1),
          onChanged: (d) {
            setState(() {});
          },
          hintText: Loc.alized.enter_email,
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
                Loc.alized.forgot_password,
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
