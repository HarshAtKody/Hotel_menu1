// ignore_for_file: constant_identifier_names, non_constant_identifier_names, use_build_context_synchronously

import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hotel_menu1/utils/extension/string_extension.dart';
import 'package:hotel_menu1/utils/theme_const.dart';
import 'package:hotel_menu1/utils/widgets/cache_image.dart';
import 'package:hotel_menu1/utils/widgets/common_button.dart';
import 'package:hotel_menu1/utils/widgets/round_button.dart';


///Constant Values
int maxMobileLength = 10;
int minUserNameLength = 4;
int maxEmailLength = 40;
int maxTextLength6 = 6;
int maxPasswordLength = 15;
int maxTextLength30 = 30;
int maxTextLength60 = 40;
int maxBioLength = 140;
int maxAboutUsLength = 200;
int maxPriceLength = 8;
int maxOfferClaimLength = 3;
int maxOfferDiscountLength = 2;
int maxPinCodeLength = 6;
int visibleGenreListLength = 4;
//Hive Object
var userBox = Hive.box('userBox');

String currency = "USD";

//Hive Data Keys
const String KEY_APP_LANGUAGE = "key_application_language";
const String KEY_IS_ONBOARDING_SHOWED = "key_is_onboarding_showed";
const String KEY_USER_DATA = "key_user_data";
const String KEY_USER_ACCESS_TOKEN = 'key_user_access_token';
const String KEY_DEVICE_ID = "key_device_id";
const String KEY_USER_REFRESH_TOKEN = 'key_user_refresh_token';
const String KEY_FCM_DEVICE_TOKEN = 'key_fcm_device_token';
const String KEY_USER_ID = 'key_user_id';
const String KEY_APP_THEME_DARK = 'key_app_theme_dark';
const String KEY_AUDIO_LAST = 'key_audio_last';
const String KEY_CURRENT_PLAYED_BOOK_ID = 'KEY_CURRENT_PLAYED_BOOK_ID';
const String KEY_SUBSCRIPTION_TYPE = "KEY_SUBSCRIPTION_TYPE";


/// Twitter Data
const String apikey_twitter = "XKbs9dXKds9QXFIdS0N1t8sKB";
const String secretkey_twitter = "lQAIwRT13sYlim3oXCLALhI22du9K4mEUJXrz5w5BGHSOU4bsM";
const String redirectionUrl_twitter = "https://hotel_menu1app.firebaseapp.com/__/auth/handler";

///Hive Data
String getAppLanguage() => (userBox.get(KEY_APP_LANGUAGE) ?? "en");
bool getIsOnBoardingShowed() => (userBox.get(KEY_IS_ONBOARDING_SHOWED) ?? false);
String getDeviceID() => (userBox.get(KEY_DEVICE_ID) ?? "");
String getDeviceFCMToken() => (userBox.get(KEY_FCM_DEVICE_TOKEN) ?? "123456");
String getUserData() => (userBox.get(KEY_USER_DATA) ?? "");
String getUserAccessToken() => (userBox.get(KEY_USER_ACCESS_TOKEN) ?? "");
String getUserId() => (userBox.get(KEY_USER_ID) ?? 0);
bool? getIsAppThemeDark() => (userBox.get(KEY_APP_THEME_DARK));

/// Device Details
bool getIsIOSPlatform() => Platform.isIOS;
String getDeviceType() => getIsIOSPlatform() ? "iphone" : "android";

/// get Audio Data
String getLastPlayer()=> (userBox.get(KEY_AUDIO_LAST));
String getCurrentPlayedBookId() => (userBox.get(KEY_CURRENT_PLAYED_BOOK_ID) ?? "");

/// get subscription data
bool getSubscriptionTypeFree() => (userBox.get(KEY_SUBSCRIPTION_TYPE) == "free" ? true : false);


bool isDarkMode = false;

///Regex Validation
RegExp RegXMobile = RegExp(r'[0-9]');

//Common Data

/*
  * -- Validations
  * */

//-- BASIC SCREEN HEIGHT & WIDTH---
// basicDeviceHeightWidth(BuildContext context) {
//   return ScreenUtil.init(context, designSize: Size(375, 812), allowFontScaling: false);
// }
//
// double setHeight(var height) {
//   return ScreenUtil().setHeight(height);
// }
//
// double setWidth(var width) {
//   return ScreenUtil().setWidth(width);
// }
//
// double setSp(var fontSize) {
//   return ScreenUtil().setSp(fontSize);
// }

///Get Localize Text
String getLocalValue(String key) {
  return key.tr();
}

TextStyle getTextStyle({
  required String fontFamily,
  Color txtColor = Colors.black,
  TextDecoration txtDecoration = TextDecoration.none,
  required double fontSize,
  required FontWeight fontWeight}) {
  return TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
    color: txtColor,
    decoration: txtDecoration,
  );
}


showLog(String str) {
  if (kDebugMode) {
    print("-> $str");
  }
}

isPasswordValid(String str) {
  if (str.length >= 8 && str.length <= 15) {
    return true;
  } else {
    return false;
  }
}

isPhoneNumberValid(String str) {
  if (str.isNotEmpty && str.length == 10) {
    return true;
  } else {
    return false;
  }
}

bool isKeyBoardOpen(BuildContext context) {
  return MediaQuery.of(context).viewInsets.bottom > 0;
}

///Is URL valid
isURLValid(String str) {
  Pattern pattern =
      r'(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?';
  // RegExp regex = new RegExp(pattern.toString());
  var regex = RegExp(pattern.toString(), caseSensitive: false);
  if (!(regex.hasMatch(str))) {
    return false;
  } else {
    return true;
  }
}

isEmailValid(String str) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  // RegExp regex = new RegExp(pattern);
  RegExp regex = RegExp(pattern.toString());
  if (!(regex.hasMatch(str))) {
    return false;
  } else {
    return true;
  }
}

//-- Date Convert---
String getCustomFormatDateFromDateTime(DateTime dateTime, String outputFormat) {
  return DateFormat(outputFormat).format(dateTime);
}

String getCustomFormatDateFromStringDate(
    String date, String inputFormat, String outputFormat) {
  DateTime dateTime = DateFormat(inputFormat).parse(date);
  return DateFormat(outputFormat).format(dateTime);
}

DateTime getDateFromStringDate(String date, String inputFormat) {
  return DateFormat(inputFormat).parse(date);
}

showSnackBar(var scaffoldKey, String value) {
  scaffoldKey.currentState.showSnackBar(SnackBar(
    content: Text(
      value,
      style: TextStyle(
        color: Colors.white,
        fontSize: 14.sp,
      ),
    ),
    backgroundColor: Colors.black,
    duration: const Duration(seconds: 2),
  ));
}

showCommonBottomSheet(BuildContext context, Widget child) {
  return showModalBottomSheet(
      isDismissible: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35.h),
        topRight: Radius.circular(35.h),
      )),
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (context) => child);
}

bool isInternetConnectionOn = true;

Future<bool> checkInternet(BuildContext context,
    {bool showAlert = true}) async {
  if (!isInternetConnectionOn && showAlert) {
    showMessageDialog(context, "Key_NoInternetConnection".tr(), () => null);
  }
  showLog("Status $isInternetConnectionOn");
  return isInternetConnectionOn;
  // try {
  //   final result = await InternetAddress.lookup('google.com');
  //
  //   if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //     return true;
  //   } else {
  //     print('--------------TRY ELSE----------------');
  //     print('--> ${result.isNotEmpty.toString()}');
  //     showMessageDialog(context, "Please check your internet connection", () => null);
  //     // showSnackBar(_scaffoldKey, "Please check your internet connection");
  //     return false;
  //   }
  // } on SocketException catch (_) {
  //   showMessageDialog(context, "Please check your internet connection", () => null);
  //   // showSnackBar(_scaffoldKey, "Please check your internet connection");
  //   return false;
  // }
}

// final kInnerDecoration = BoxDecoration(
//   color_assessment_running_test: Colors.white,
// //  border: Border.all(color_assessment_running_test: Colors.white),
//   borderRadius: BorderRadius.circular(32),
// );

// final kGradientBoxDecoration = BoxDecoration(
//   gradient: LinearGradient(colors: [Color(0xFF00D2FF), Color(0xFF3A7BD5)]),
//   borderRadius: BorderRadius.circular(32),
// );

// LinearGradient gradient = LinearGradient(
//     begin: FractionalOffset.topCenter,
//     end: FractionalOffset.bottomCenter,
// //    tileMode: TileMode.repeated,
//     colors: <Color>[
//       Color(0xFF00D2FF), Color(0xFF3A7BD5)
//     ]);
//
// final Shader linearGradient = LinearGradient(
//   colors: <Color>[Color(0xFF00D2FF), Color(0xFF3A7BD5)],
// ).createShader(Rect.fromLTWH(0.0, 0.0, 150.0, 70.0));

//showSnackBar(BuildContext context,String strMessage)
//{
//  Scaffold.of(context).showSnackBar(SnackBar(
//    content: Text(strMessage),
//    duration: Duration(seconds: 3),
//  ));
//}

getSelectedLanguage(Function() resultBlock) async {
  // appLanguage = userBox.get(Constant.active_app_language);
  //
  // print("Constant Lan - $appLanguage");
  // if (appLanguage == "" || appLanguage == null) {
  //   userBox.put(Constant.active_app_language, "en");
  //   appLanguage = userBox.get(Constant.active_app_language);
  //   print("Preference Lan - ${userBox.get(Constant.active_app_language)}");
  // }
  // print("Constant APP Lan - $appLanguage");
  //
  // resultBlock();
//  SharedPreferences preferences = await SharedPreferences.getInstance();
//  Constant.appLanguage = preferences.getString(Constant.active_app_language);

  if (getAppLanguage() == "") {
//    preferences.setString(Constant.active_app_language, "en");
//    Constant.appLanguage = preferences.getString(Constant.active_app_language);
//    print(
//        "Preference Lan - ${preferences.getString(Constant.active_app_language)}");
  }

  showLog("Constant APP Lan - ${getAppLanguage()}");

  resultBlock();
}

hideKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}

//-- Date Convert---
String generateFileName() {
  return DateFormat("yyyy_MM_dd_HH_mm_ss_SSS").format(DateTime.now());
}

logout(BuildContext context) async {
  String appLanguage = getAppLanguage();
  bool isOnBoarding = getIsOnBoardingShowed();
  String deviceToken = getDeviceFCMToken();

  await userBox.clear();

  saveLocalData(KEY_APP_LANGUAGE, appLanguage);
  saveLocalData(KEY_IS_ONBOARDING_SHOWED, isOnBoarding);
  saveLocalData(KEY_FCM_DEVICE_TOKEN, deviceToken);

  // Route route = SlideRightPageRoute(builder: (context) => GetStartedScreen());
  // Navigator.of(context).pushAndRemoveUntil(route, (route) => false);
}

//-- image picker
var imgSelectOption = {"camera", "gallery"};

commonImagePickerDialog({parentContext}) async {
  String str = "";
  await showDialog(
    barrierDismissible: false,
    context: parentContext,
    builder: (context) {
      return SimpleDialog(
        title: Center(
          child: Text("Key_Select_Photo".tr(),
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w700)),
        ),
        children: <Widget>[
          SimpleDialogOption(
              child: Text(
                "Key_Photo_With_Camera".tr(),
                style: TextStyle(
                    fontSize: 12.sp,
                    color: Constant().clrBlack,
                    fontWeight: Constant().fwRegular,
                    fontFamily: Constant().fontFamily),
              ),
              onPressed: () async {
                Navigator.pop(parentContext);
                str = imgSelectOption.elementAt(0);
              }),
          SimpleDialogOption(
              child: Text(
                "Key_Image_From_Gallery".tr(),
                style: TextStyle(
                    fontSize: 12.sp,
                    color: Constant().clrBlack,
                    fontWeight: Constant().fwRegular,
                    fontFamily: Constant().fontFamily),
              ),
              onPressed: () async {
                Navigator.pop(parentContext);
                str = imgSelectOption.elementAt(1);
              }),
          SizedBox(
            height: 10.h,
          ),
          SimpleDialogOption(
            child: Center(
                child: Text("Key_Cancel".tr(),
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w700))),
            onPressed: () => Navigator.pop(context),
          )
        ],
      );
    },
  );
  return str;
}

showConfirmationDialog(BuildContext context, String image, String title, String message, Function(bool isPositive) didTakeAction) {
  return showDialog(
      barrierDismissible: true,
      context: context,
      barrierColor: Constant().clrDialogBGByTheme(),
      builder: (context) => Dialog(
            backgroundColor: Constant().clrScaffoldBGByTheme(),
            insetPadding: EdgeInsets.all(16.sp),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5))),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: 25.w, right: 25.w, top: 23.h, bottom: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: image == "" ? 0.h : 50.h,
                      ),
                      image == ""
                          ? const Offstage()
                          : SizedBox(height: 26.h,),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Constant().clrTextMainFontByTheme(),
                            fontWeight: Constant().fwBold,
                            fontFamily: Constant().fontFamily),
                      ),
                      SizedBox(height: 10.h,),
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: Constant().clrTextByTheme(),
                            fontWeight: Constant().fwMedium,
                            fontFamily: Constant().fontFamily),
                      ),
                      SizedBox(height: 30.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonButton(
                              label: "Key_No".tr(),
                              width: 100.w,
                              borderRadius: 5.r,
                              onTap: () {
                                Navigator.pop(context);
                                Future.delayed(const Duration(milliseconds: 80),
                                    () {
                                  didTakeAction(false);
                                });
                              },
                              borderColor: Constant().clrPrimary,
                              bgColor: Constant().clrPrimary,
                              labelColor: Constant().clrWhite),
                          SizedBox(
                            width: 15.w,
                          ),
                          CommonButton(
                              width: 100.w,
                              borderRadius: 5.r,
                              label: "Key_YES".tr(),
                              onTap: () {
                                Navigator.pop(context);
                                Future.delayed(const Duration(milliseconds: 80),
                                    () {
                                  didTakeAction(true);
                                });
                              },
                              borderColor: Constant().clrGreyCardBg,
                              bgColor: Constant().clrGreyCardBg,
                              labelColor: Constant().clrBlack),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
}

///Set Navigation Redirection
// setNavigationRedirection(BuildContext context, ProfileController profileWatch) async {
//   showLog("Set Navigation With Common Method");
//
//   String accessToken = getUserAccessToken();
//
//   late Route route;
//
//   if(accessToken.isNotEmpty){
//     if(profileWatch.profileResponseModel?.data?.mySubscription != null){
//       showLog("Drawer Menu Screen");
//       route = SlideRightPageRoute(builder: (context) => const DrawerMenu(), settings: const RouteSettings());
//     }else{
//       showLog("Plan Screen");
//       route = SlideRightPageRoute(builder: (context) => const PlanScreen(fromScreen: ScreenName.SplashScreen), settings: const RouteSettings());
//     }
//   }
//   else{
//     showLog("getIsOnBoardingShowed()");
//     showLog("${getIsOnBoardingShowed()}");
//
//     if(getIsOnBoardingShowed()){
//       showLog("Login Screen");
//       route = SlideRightPageRoute(builder: (context) => const LoginScreen(), settings: const RouteSettings());
//     }
//     else{
//       showLog("On Boarding Screen");
//       route = SlideRightPageRoute(builder: (context) => const OnBoardingScreen(), settings: const RouteSettings());
//     }
//   }
//   Navigator.of(context).pushAndRemoveUntil(route,(route) => false);
// }

///Save Local Data
saveLocalData(String key, value) {
  userBox.put(key, value);
  showLog("Saved new data into your local Key - $key Value - ${userBox.get(key)}");
}

///String URL Encode
String getEncodedURLString(String value) {
  return Uri.encodeFull(value);
}

Widget placeholderWidget(String imageURL, double width, double height) {
  return Image.network(
    getEncodedURLString(imageURL),
    fit: BoxFit.fill,
    width: width.w,
    height: height.h,
    loadingBuilder: (context, childWidget, loadingProgress) {
      if (loadingProgress == null) {
        return childWidget;
      } else {
        return Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage("assets/images/login_image.png"),
              ),
            ),
          ),
        );
      }
    },
  );
}

showMessageDialog(BuildContext context, String message, Function()? didDismiss) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: Constant().clrDialogBGByTheme(),
      builder: (context) => Dialog(
            backgroundColor: Constant().clrScaffoldBGByTheme(),
            insetPadding: EdgeInsets.all(16.sp),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5))),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(220),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 25.w, right: 25.w, top: 23.h, bottom: 15.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Text(
                            message,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Constant().clrTextByTheme(),
                                fontWeight: Constant().fwMedium,
                                fontFamily: Constant().fontFamily),
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        SizedBox(
                          height: 50.h,
                          child: RoundButton(
                            titleColor: Constant().clrWhite,
                            bgColor: Constant().clrPrimary,
                            borderColor: Constant().clrPrimary,
                            fontSize: 14.sp,
                            label: "Key_Ok".localized,
                            onTap: () {
                              Navigator.pop(context);
                              if (didDismiss != null) {
                                Future.delayed(const Duration(milliseconds: 80),
                                    () {
                                  didDismiss();
                                });
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ));
}

showAnimationMessageDialog(BuildContext context, String message, String subMsg,
    Function()? didDismiss) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
            backgroundColor: Constant().clrWhite,
            insetPadding: EdgeInsets.all(16.sp),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5))),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    if (didDismiss != null) {
                      Future.delayed(const Duration(milliseconds: 80), () {
                        didDismiss();
                      });
                    }
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: ScreenUtil().setHeight(220),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 25.w, right: 25.w, top: 23.h, bottom: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // SizedBox(
                          //     height: 70.h,
                          //     width: 70.h,
                          //     child: Lottie.asset(
                          //         'assets/gif/tik_animation.json')),
                          Flexible(
                            child: Text(
                              message,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Constant().clrBlack,
                                  fontWeight: Constant().fwBold,
                                  fontFamily: Constant().fontFamily),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Flexible(
                            child: Text(
                              subMsg,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Constant().clrBlack,
                                  fontWeight: Constant().fwMedium,
                                  fontFamily: Constant().fontFamily),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
}

showCommonSuccessDialog(BuildContext context, String image, String title, String message, Function()? didDismiss,{bool pagename = true}) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: Constant().clrDialogBGByTheme(),
      builder: (context) {
        Future.delayed(const Duration(seconds: 3), () {
          if(pagename == true) {
            Navigator.of(context).pop();
          }
          didDismiss!();
          // if (didDismiss != null) {
          //   didDismiss();
          // }
        });
        return Dialog(
          backgroundColor: Constant().clrScaffoldBGByTheme(),
          insetPadding: EdgeInsets.all(16.sp),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: ScreenUtil().setHeight(270),
                child: Padding(
                  padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 30.h, bottom: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        image,
                        height: 76.h,
                        width: 66.w,
                      ),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22.sp,
                            color: Constant().clrTextByTheme(),
                            fontWeight: Constant().fwSemiBold,
                            fontFamily: Constant().fontFamily),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Flexible(
                        child: Text(
                          message,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Constant().clrTextGrey,
                              fontWeight: Constant().fwRegular,
                              fontFamily: Constant().fontFamily),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      });
}


showAvatarUseDialog(BuildContext context,String image ,String title,Function()? didDismiss,{String? buttonTitle}) {
  return showDialog(barrierDismissible: true, context: context, barrierColor: Constant().clrDialogBGByTheme(),
      builder: (context) {
        return Dialog(
          backgroundColor: Constant().clrScaffoldBGByTheme(),
          insetPadding: EdgeInsets.all(16.sp),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(27))),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SizedBox(
                width: 310.h,
                height: 310.h,
                child:
                Padding(
                  padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 23.h, bottom: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Constant().clrPrimary,
                            fontWeight: Constant().fwBold,
                            fontFamily: Constant().fontFamily
                        ),),
                      SizedBox(height: 20.h,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: CacheImage(
                          imageURL: image,
                          height: 130.h,
                          width: 130.h,
                          contentMode: BoxFit.cover,
                        ),
                      ),

                      SizedBox(height: 25.h,),
                      SizedBox(
                        height: 50.h,
                        width: 260.w,
                        child: RoundButton(
                          titleColor: Constant().clrWhite,
                          bgColor: Constant().clrTextMainFont,
                          borderColor: Constant().clrTextMainFont,
                          fontSize: 14.sp,
                          label:buttonTitle ?? "Key_USE".localized,
                          onTap: (){
                            if(didDismiss != null){
                              Future.delayed(const Duration(milliseconds: 110), () {
                                Navigator.pop(context);
                                didDismiss();
                              });
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
  );
}

showFollowersDialog(BuildContext context,Function()? didDismiss) {
  return showDialog(barrierDismissible: false, context: context, barrierColor: Constant().clrDialogBGByTheme(),
      builder: (context) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pop(context);
          if (didDismiss != null) {
            didDismiss();
          }
        });
        return Dialog(
          backgroundColor: Constant().clrScaffoldBGByTheme(),
          insetPadding: EdgeInsets.all(16.sp),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5))),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: ScreenUtil().setHeight(90),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 25.w, right: 25.w, top: 23.h, bottom: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        children: [
                          // Image.asset(
                          //   Constant().icOutlinedUser,
                          //   height: 12.5.h,
                          //   width: 12.5.w,
                          // ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            "Key_RemoveFollower".tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Constant().clrFontCart,
                                fontWeight: Constant().fwRegular,
                                fontFamily: Constant().fontFamily),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          // Image.asset(
                          //   Constant().icFlag,
                          //   height: 12.5.h,
                          //   width: 12.5.w,
                          // ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            "Key_ReportProfile".tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Constant().clrFontCart,
                                fontWeight: Constant().fwRegular,
                                fontFamily: Constant().fontFamily),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

logoutDialog(BuildContext context, Function(bool isPositive) didTakeAction) {
  return showDialog(
      barrierDismissible: true,
      context: context,
      barrierColor: Constant().clrDialogBGByTheme(),
      builder: (context) => Dialog(
            backgroundColor: Constant().clrScaffoldBGByTheme(),
            insetPadding: EdgeInsets.all(16.sp),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(30))),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: 25.w, right: 25.w, top: 30.h, bottom: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Key_LogoutMSG".tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Constant().clrTextByTheme(),
                              fontWeight: Constant().fwMedium,
                              fontFamily: Constant().fontFamily)),
                      SizedBox(
                        height: 30.h,
                      ),
                      CommonButton(
                          label: "Key_Logout".tr().toUpperCase(),
                          onTap: () {
                            Navigator.pop(context);
                            Future.delayed(const Duration(milliseconds: 80),
                                () {
                              didTakeAction(true);
                            });
                          },
                          borderColor: Constant().clrPrimary,
                          bgColor: Constant().clrPrimary,
                          labelColor: Constant().clrWhite),
                      SizedBox(
                        width: 15.w,
                      ),
                      CommonButton(
                          label: "Key_Cancel".tr().toUpperCase(),
                          onTap: () {
                            Navigator.pop(context);
                            Future.delayed(const Duration(milliseconds: 80),
                                () {
                              didTakeAction(false);
                            });
                          },
                          borderColor: Constant().clrScaffoldBGByTheme(),
                          bgColor: Constant().clrScaffoldBGByTheme(),
                          labelColor: Constant().clrTextByTheme()),
                    ],
                  ),
                ),
              ],
            ),
          ));
}

logoutAction(BuildContext context) async {

  String appLanguage = getAppLanguage();
  String deviceToken = getDeviceFCMToken();

  await userBox.clear();

  saveLocalData(KEY_APP_LANGUAGE, appLanguage);
  saveLocalData(KEY_FCM_DEVICE_TOKEN, deviceToken);
  saveLocalData(KEY_IS_ONBOARDING_SHOWED, true);

  /// navigate to login screen
  // Route route = SlideRightPageRoute(builder: (context) => const LoginScreen(), settings: const RouteSettings());
  //   Navigator.of(context).pushAndRemoveUntil(route,(route) => false);
}


Widget widgetNoDataFound(String message) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 20.h),
    child: Center(
        child: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: Constant().fontFamily,
          fontSize: 14.sp,
          fontWeight: Constant().fwMedium,
          color: Constant().clrBlack),
    )),
  );
}

//For Get last word from String
String getLastWordFromString(String txt) {
  List<String> words = txt.split(" ");
  String lastWord = words[words.length - 1];
  return lastWord;
}

//For Remove last word after text
String getRemoveLastWordAfterString(String txt) {
  List<String> words = txt.split(" ");
  String lastWord = words[words.length - 1];
  int count = lastWord.length;
  String finalTxt = txt.substring(0, txt.length - count);
  showLog("Remove after last word : $finalTxt");
  return finalTxt;
}

enum ScreenName {
  None,
  SplashScreen,
  LoginScreen,
  ResetPasswordScreen,
  RegisterCoachScreen,
  EditProfileScreen,
  EditEmailScreen,
  EditPhoneScreen,
  SignUpScreen,
  ProfileScreen,
  OtpScreen,
  AddContactScreen,
  EditContactScreen,
  MuseumViewScreen,
  MuseumListScreen,
  BookDetailsScreen,
  PlanScreen,
  LibraryScreen,
  AvatarScreen,
  ChatScreen
}

enum NotificationSlug{
  new_news_published,
  new_book_published,
  new_artifact_published,
  new_member_request_received,
  new_message_received
}

enum SeeAllBookScreen {
  fromHomeSearch,
  fromHomeTrendingBook,
  fromHomeRecommendedBook,
  fromHomeMostReadBook,
  fromChatScreen,
  fromBookmarkScreen,
  fromBookSelfScreen,
  fromLastReadBookScreen,
  fromBookSelfFavoriteScreen,
  fromAddMemberScreen,
  fromAllRequestListScreen,
  fromFriendListScreen,
  fromBookClubListScreen,
  fromProfileAddMemberScreen,
  fromProfileScreen
}
