import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/page/login/facebook_googel_view.dart';
import 'package:new_trip_ui/routes/navigator.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/gradient_text.dart';
import 'package:new_trip_ui/widgets/remove_focuse.dart';
import 'package:new_trip_ui/widgets/text_field_view.dart';

import '../../widgets/custom_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  FocusNode mailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome back!',
                      style: TextStyles(context).getTitleStyle(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 8),
                      child: Text(
                        'Login toyou existing account',
                        style: TextStyles(context).getDescriptionStyle(),
                      ),
                    ),
                    _getMailUI(),
                    _getPasswordUI(),
                    Center(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8.0),
                        onTap: () {
                          NavigationServices().gotoForgotPasswordScreen();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            Loc.alized.forgot_password,
                            style: TextStyle(
                                fontSize: 12,
                                color: AppTheme.lightTextColor,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 24, right: 24, top: 8.0),
                      child: CustomButton(
                        radius: 24,
                        padding: const EdgeInsets.all(0),
                        onTap: () {
                          NavigationServices().gotoHomeScreen();
                        },
                        textWidget: Text(
                          Loc.alized.log_in,
                          style: TextStyles(context)
                              .getRegularStyle()
                              .copyWith(color: AppTheme.whiteColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Row(
                        children: const [
                          Expanded(
                            child: FaceBookAndGoogleView(
                              title: 'Facebook',
                              color: Color(0xff4867AA),
                              icon: FontAwesomeIcons.facebook,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: FaceBookAndGoogleView(
                              title: 'Google',
                              color: Colors.red,
                              icon: FontAwesomeIcons.google,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
          const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 24.0, right: 24.0),
      child: TextFieldView(
          controller: mailController,
          focusNode: mailFocusNode,
          titleText: Loc.alized.email,
          height: 44,
          contextPadding: const EdgeInsets.only(bottom: 6, left: 8),
          color: Colors.transparent,
          colorBorder: mailFocusNode.hasPrimaryFocus
              ? AppTheme.primaryColor
              : AppTheme.primaryTextColor.withOpacity(0.1),
          onChanged: (d) {
            setState(() {});
          },
          hintText: Loc.alized.enter_email),
    );
  }

  Widget _getPasswordUI() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 4.0, bottom: 8.0, left: 24.0, right: 24.0),
      child: SizedBox(
        child: TextFieldView(
          controller: passwordController,
          focusNode: passwordFocusNode,
          titleText: Loc.alized.password,
          height: 44,
          contextPadding: const EdgeInsets.only(bottom: 6, left: 8),
          color: Colors.transparent,
          colorBorder: passwordFocusNode.hasFocus
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

  Widget _getAppBar() {
    return Padding(
      padding: EdgeInsets.only(
          left: 24,
          right: 24.0,
          top: MediaQuery.of(context).padding.top + 8,
          bottom: 16),
      child: GradientText(
        gradient: LinearGradient(
          colors: AppTheme.regularGradient,
        ),
        child: Text(
          Loc.alized.log_in,
          style:
              TextStyles(context).getTitleStyle().copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
