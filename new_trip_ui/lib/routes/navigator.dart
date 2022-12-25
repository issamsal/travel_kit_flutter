import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_trip_ui/models/hotel_list_data.dart';
import 'package:new_trip_ui/page/Feed/chat_cell_view.dart';
import 'package:new_trip_ui/page/explore/components/category_details/category_details_page.dart';
import 'package:new_trip_ui/page/explore/components/country_details/country_details_page.dart';
import 'package:new_trip_ui/page/explore/components/culuture_details/culture_details_page.dart';
import 'package:new_trip_ui/page/home/home.dart';
import 'package:new_trip_ui/page/location/hotel_details/hotel_details_page.dart';
import 'package:new_trip_ui/page/location/location_page.dart';
import 'package:new_trip_ui/page/login/forgot_password.dart';
import 'package:new_trip_ui/page/login/login_and_sing_up_page.dart';
import 'package:new_trip_ui/page/login/login_screen.dart';
import 'package:new_trip_ui/page/login/sign_up_screen.dart';
import 'package:new_trip_ui/page/splashscreen/introduction_screen.dart';
import 'package:new_trip_ui/page/setting/add_new_credit_card.dart';

import '../page/login/congratulations_screen.dart';
import '../page/login/reset_password.dart';

class NavigationServices {
  Future<dynamic> pushMaterialPageRoute(Widget widget,
      {bool fullscreenDialog = false}) async {
    return await Get.to(widget, fullscreenDialog: fullscreenDialog);
  }

  void gotoLoginScreen() async {
    await Get.offAll(const LogInScreen());
  }

  void gotoLoginAndSingUpPage() async {
    await Get.offAll(const LoginAndSingUpPage());
  }

  void gotoSingUpScreen() async {
    await Get.offAll(const SignUpScreen());
  }

  void gotoIntroductionScreen() async {
    await Get.offAll(const IntroductionScreen());
  }

  void gotoHomeScreen() async {
    await Get.offAll(const HomeScreen());
  }

  void gotoAddCreditPage() async {
    await pushMaterialPageRoute(const AddNewCrediCard());
  }

  void gotoMessageScreen() async {
    await pushMaterialPageRoute(const MessageScreen());
  }

  void gotoForgotPasswordScreen() async {
    await pushMaterialPageRoute(const ForgotPassword());
  }

  void gotoResetPassWordScreen() async {
    await pushMaterialPageRoute(const ResetPassWordScreen());
  }

  void gotoCongratulationsScreen() async {
    await pushMaterialPageRoute(const CongratulationsScreen());
  }

  void gotoLocationPage() async {
    await pushMaterialPageRoute(const LocationPage());
  }

  void gotoHotelPage(HotelListData hotelListData) async {
    await pushMaterialPageRoute(HotelDeailsPage(
      hotelListData: hotelListData,
    ));
  }

  void gotoCulutureDetailsPage(String title) async {
    await pushMaterialPageRoute(CulutureDetailsPage(
      title: title,
    ));
  }

  void gotoCountryDetailsPage(String title) async {
    await pushMaterialPageRoute(CountryDetailsPage(
      title: title,
    ));
  }

  void gotoCategoryDetailsPage(String title) async {
    await pushMaterialPageRoute(CategoryDetailsPage(
      title: title,
    ));
  }
}
