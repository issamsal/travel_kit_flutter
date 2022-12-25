import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';

import 'package:new_trip_ui/logic/language/app_localizations.dart';

import 'package:new_trip_ui/routes/navigator.dart';
import 'package:new_trip_ui/widgets/custom_button.dart';
import 'package:new_trip_ui/widgets/remove_focuse.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/gradient_text.dart';
import 'package:new_trip_ui/widgets/text_field_view.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FocusNode maileFocusNode = FocusNode();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getAppBar(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 16),
                children: [
                  Center(
                    child: Text(
                      "Let's Get Started!",
                      style: TextStyles(context).getTitleStyle(),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 8),
                      child: Text(
                        'Create a new account ',
                        style: TextStyles(context).getDescriptionStyle(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  _getMailUI(),
                  _getpasstUi(),
                  _getConfrimPasswordUI(),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 16.0),
                    child: CustomButton(
                      radius: 24,
                      padding: const EdgeInsets.all(0),
                      onTap: () {
                        NavigationServices().gotoCongratulationsScreen();
                      },
                      textWidget: Text(
                        Loc.alized.sing_up,
                        style: TextStyles(context)
                            .getRegularStyle()
                            .copyWith(color: AppTheme.whiteColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
            controller: mailController,
            focusNode: maileFocusNode,
            titleText: Loc.alized.email,
            height: 44,
            contextPadding: const EdgeInsets.only(bottom: 6, left: 8),
            color: Colors.transparent,
            colorBorder: maileFocusNode.hasFocus
                ? AppTheme.primaryColor
                : AppTheme.primaryTextColor.withOpacity(0.1),
            onChanged: (d) {
              setState(() {});
            },
            hintText: Loc.alized.enter_email),
      ),
    );
  }

  Widget _getpasstUi() {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 8),
      child: SizedBox(
        child: TextFieldView(
          hintText: Loc.alized.enter_password,
          titleText: Loc.alized.password,
          maxLines: 1,
          color: Colors.transparent,
          colorBorder: newPasswordFocusNode.hasFocus
              ? AppTheme.primaryColor
              : AppTheme.primaryTextColor.withOpacity(0.1),
          controller: newPasswordController,
          focusNode: newPasswordFocusNode,
          onChanged: (text) {
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget _getConfrimPasswordUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 8),
      child: SizedBox(
        child: TextFieldView(
          hintText: Loc.alized.enter_password,
          titleText: Loc.alized.password,
          maxLines: 1,
          color: Colors.transparent,
          colorBorder: confirmPasswordFocusNode.hasFocus
              ? AppTheme.primaryColor
              : AppTheme.primaryTextColor.withOpacity(0.1),
          controller: confirmPasswordController,
          focusNode: confirmPasswordFocusNode,
          onChanged: (text) {
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget _getAppBar() {
    return Padding(
      padding: EdgeInsets.only(
          left: 24,
          right: 24.0,
          top: MediaQuery.of(context).padding.top + 8,
          bottom: 8),
      child: GradientText(
        gradient: LinearGradient(
          colors: AppTheme.regularGradient,
        ),
        child: Text(
          Loc.alized.sing_up,
          style:
              TextStyles(context).getTitleStyle().copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
