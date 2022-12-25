import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/local_files.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';

import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/bottom_bar_animation.dart';
import 'package:new_trip_ui/widgets/card_view.dart';
import 'package:new_trip_ui/widgets/custom_button.dart';
import 'package:new_trip_ui/widgets/remove_focuse.dart';
import 'package:new_trip_ui/widgets/text_field_view.dart';

class ProfileScreen extends StatefulWidget {
  final AnimationController animationController;

  const ProfileScreen({Key? key, required this.animationController})
      : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() {
    nameTextEditinController.text = '21DawaynenJohn';
    emailTextEditinController.text = '123@gmail.com';
    passwordTextEditinController.text = '123456';
    birthTextEditinController.text = '29/02/1987';
    mobilenumberTextEditinController.text = '+1 9117150085';
  }

  TextEditingController nameTextEditinController = TextEditingController();
  TextEditingController emailTextEditinController = TextEditingController();
  TextEditingController passwordTextEditinController = TextEditingController();
  TextEditingController birthTextEditinController = TextEditingController();
  TextEditingController mobilenumberTextEditinController =
      TextEditingController();
  TextEditingController addressTextEditinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BottomBarAnimation(
      animationController: widget.animationController,
      child: RemoveFocuse(
          onClick: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: 68 + MediaQuery.of(context).padding.bottom),
                  child: Column(
                    children: [
                      _getImageUI(),
                      const SizedBox(
                        height: 8,
                      ),
                      _getUserNameUI(),
                      _getEmailUI(),
                      _getPhoneNumberUI(),
                      _getBirthOfDateUI(),
                      _getPasswordUI(),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                            top: 16,
                            bottom: MediaQuery.of(context).padding.bottom + 16),
                        child: CustomButton(
                          radius: 36,
                          textWidget: Text(Loc.alized.save,
                              style: TextStyles(context)
                                  .getRegularStyle()
                                  .copyWith(color: AppTheme.whiteColor)),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _getUserNameUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 24, right: 24),
      child: TextFieldView(
        controller: nameTextEditinController,
        color: Colors.transparent,
        colorBorder: Theme.of(context).dividerColor,
        titleText: Loc.alized.name,
      ),
    );
  }

  Widget _getEmailUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 24, right: 24),
      child: TextFieldView(
        controller: emailTextEditinController,
        color: Colors.transparent,
        colorBorder: AppTheme.primaryTextColor.withOpacity(0.1),
        titleText: Loc.alized.email,
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _getPhoneNumberUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 24, right: 24),
      child: TextFieldView(
        controller: mobilenumberTextEditinController,
        color: Colors.transparent,
        colorBorder: AppTheme.primaryTextColor.withOpacity(0.1),
        titleText: Loc.alized.number,
      ),
    );
  }

  Widget _getBirthOfDateUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 24, right: 24),
      child: TextFieldView(
        controller: birthTextEditinController,
        color: Colors.transparent,
        colorBorder: AppTheme.primaryTextColor.withOpacity(0.1),
        titleText: Loc.alized.date_of_birth,
        keyboardType: TextInputType.datetime,
      ),
    );
  }

  Widget _getPasswordUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 24, right: 24),
      child: TextFieldView(
        controller: passwordTextEditinController,
        color: Colors.transparent,
        colorBorder: AppTheme.primaryTextColor.withOpacity(0.1),
        titleText: Loc.alized.password,
        keyboardType: TextInputType.number,
        hintText: '@21DawaynenJohn',
      ),
    );
  }

  Widget _getImageUI() {
    return Center(
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          CardView(
            borderColor: AppTheme.primaryTextColor.withOpacity(0.2),
            elevation: 0,
            radius: 100,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  LocalFiles.profileJpg,
                  height: 120,
                  width: 120,
                )),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: CardView(
              radius: 20,
              elevation: 0,
              child: CircleAvatar(
                backgroundColor: AppTheme.primaryColor,
                child: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: AppTheme.primaryTextColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
