// ignore_for_file: constant_identifier_names, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_menu1/utils/const.dart';


enum CMSType {
  None,
  AboutUs,
  TermsCondition,
  PrivacyPolicy,
  // FAQ,
}


class Constant {
  final String appName = "Muzic-App";

/*
  * -- Dimen
  * */
  final double infiniteSize = double.infinity;

  /*
  * -- Time Format
  * */
  final String str12Hr = "hh:mm a";
  final String str24Hr = "hh:mm:ss";

  /*
  * ------------------------ Colors ----------------------------------------- *
  * */
  MaterialColor colorPrimary = MaterialColor(0xff6A71CE, colorSwathes);

  static Map<int, Color> colorSwathes = {
    50: const Color.fromRGBO(106, 113, 206, .1),
    100: const Color.fromRGBO(106, 113, 206, .2),
    200: const Color.fromRGBO(106, 113, 206, .3),
    300: const Color.fromRGBO(106, 113, 206, .4),
    400: const Color.fromRGBO(106, 113, 206, .5),
    500: const Color.fromRGBO(106, 113, 206, .6),
    600: const Color.fromRGBO(106, 113, 206, .7),
    700: const Color.fromRGBO(106, 113, 206, .8),
    800: const Color.fromRGBO(106, 113, 206, .9),
    900: const Color.fromRGBO(106, 113, 206, 1),
  };

  Color clrTextByTheme() => isDarkMode ? clrPrimary : clrTextMainFont;
  Color clrTextGreyByTheme() => isDarkMode ? clrWhite : clrTextMainFont;
  Color clrSearchFontByTheme() => isDarkMode ? clrPrimary : clrSearchFont;
  Color clrButtonBGGreyByTheme() => isDarkMode ? clrPrimary : clrTextMainFont;
  Color clrImageColorByTheme() => isDarkMode ? clrPrimary : clrTextMainFont;
  Color clrDrawerBgByTheme() => isDarkMode ? clrTextMainFont : clrPrimary;
  Color clrTextMainFontByTheme() => isDarkMode ? clrWhite : clrBlack;
  Color clrWhiteBlackByTheme() => isDarkMode ? clrWhite : clrBlack;
  Color clrTextDarkGreyByTheme() => isDarkMode ? clrHintText : clrDarkGrey;
  Color clrTextLightGreyByTheme() => isDarkMode ? clrWhite : clrTextGrey;
  Color clrTextByScaffoldTheme() => isDarkMode ? clrBlack : clrWhite;
  Color clrScaffoldBGByTheme() => isDarkMode ? clrBlack : clrWhite;
  Color clrCardBGByTheme() => isDarkMode ? clrNotificationDelete : clrWhite; //clrDarkGrey
  Color clrButtonFGByTheme(bool isOn) => isOn ? clrWhite : isDarkMode ? clrWhite : clrDarkBlue;
  Color clrButtonBGByTheme(bool isOn) => isOn ? isDarkMode ? clrPrimary : clrTextMainFont : isDarkMode ? clrPrimary : clrHintText;
  Color clrButtonBorderByTheme() =>  isDarkMode ? clrWhite : clrTextMainFont;
  Color clrDividerByTheme() =>   isDarkMode? clrWhite : clrTextGrey;
  Color clrDialogBGByTheme() => (isDarkMode ? clrWhite : clrBlack).withOpacity(0.3);
  Color clrTextFieldTextByTheme() => isDarkMode ? clrPrimary : clrTextMainFont;

  Color clrTextFieldBorderColorByTheme() => isDarkMode ? clrPrimary : clrHintText;

  Color clrTextFieldDisableBorderColorByTheme() => isDarkMode ? clrWhite : clrTransparent;
  Color clrSuggestionTextByTheme() => isDarkMode ? clrPrimary : clrTextGrey;

  //this is for contact us screen
  Color clrContactUsTextByTheme() => isDarkMode ? clrWhite : clrTextLightGrey ;
  Color clrDropDownBGColorByTheme() => isDarkMode ? clrTextMainFont : clrWhite;
  Color clrDescriptionTextByTheme() => isDarkMode ? clrWhite : clrTextMainFont;
  Color clrNewsTextByTheme() => isDarkMode ? clrWhite : clrDialogTitle;


  //this is for support history screen
  Color clrSupportHistoryTextByTheme() => isDarkMode ? clrWhite : clrtextGrey;

  //this is for onBoarding screen
  Color clrOnBoardingTextByTheme() => isDarkMode ? clrWhite : clrTextGrey;
  Color clrSelectIndicatorByTheme() => isDarkMode ? clrHintText : clrTextMainFont ;
  Color clrUnSelectIndicatorByTheme() => isDarkMode ? clrTextMainFont : clrIndicator ;

  //this is for news indicator
  Color clrNewsIndicatorUnSelectByTheme() => isDarkMode ? clrFontCart : clrReceiveBg ;

  //this is for splash screen
  Color clrBackGroundByTheme() => isDarkMode ? clrTextMainFont : clrWhite ;

  //this is for sign in screen
  Color clrSignInDividerByTheme() => isDarkMode ? clrWhite : clrTextMainFont;
  Color clrLoginTextByTheme() => isDarkMode ? clrPrimary : clrTextMainFont;
  Color clrSignInTextByTheme() => isDarkMode ? clrWhite : clrTextMainFont;

  //this is for news indicator
  Color clrDividerColorByTheme() => isDarkMode ? clrHintText : clrReceiveBg ;

  //this is for museum screen indicator
  Color clrIndicatorColorByTheme() => isDarkMode ? clrTextGrey : clrTextMainFont;

  Color clrHomeSearchColorByTheme() => isDarkMode ? clrPrimary : clrBannerBorder ;
  Color clrHomeSearchIconByTheme() => isDarkMode ? clrPrimary : clrTextGrey;
  Color clrBookmarkIconByTheme() => isDarkMode ? clrPrimary : clrWhite;

  //this is for notification text
  Color clrNotificationTextByTheme() => isDarkMode ? clrWhite : clrTextMainFont ;

  /*
  * ------------------------end  Added by vandan raval 23-06-2022 ----------------------------------------- *
  * */


  Color clrPrimary = const Color(0xffC2AA78);
  Color clrWhite = const Color(0xffFFFFFF);
  Color clrScaffoldBGDarkMode = const Color(0xff191919);
  Color clrBlack = const Color(0xff000000);
  Color clrTextMainFont = const Color(0xff2B2B2B);
  Color clrHintText = const Color(0xffABA7A6); // change from 0xffB8B8B8
  Color clrCartBack = const Color(0xffF5F6F9);
  Color clrBookView = const Color(0xffD4C8AF);
  Color clrPrimaryLight = const Color(0xff979CDE);

  Color clrCardShadow = const Color(0xffc2aa7833);
  Color clrSearchFont = const Color(0xff858585);
  Color clrTextGrey = const Color(0xff979797);
  Color clrTextLightGrey = const Color(0xffB1B1B1);
  Color clrDivider = const Color(0xff474747);
  Color clrDarkGrey = const Color(0xff4E4E4E);
  Color clrLightPurple = const Color(0xffC6C8E3);
  Color clrUnSelectedTab = const Color(0xffA3A5B8);
  Color clrOtpGrey = const Color(0xffE1E1E1);
  Color clrIndicator = const Color(0xff2b2b2b42);
  Color clrBannerGrey = const Color(0xffE2E2E2);
  Color clrBannerBorder = const Color(0xffC4C4C4);
  Color clrDarkRed = const Color(0xffFF3B3B);
  Color clrBottomUnselect = const Color(0xffcecece);
  Color clrGreyShadow = const Color(0xffDFDFDF);
  Color clrTransparent = const Color(0x00000000);
  Color clrTextFieldBorder = const Color(0xffF2F2F2);
  Color clrtextGrey = const Color(0xff6B6B6B);

  Color clrLightRed = const Color(0xffFF5D5D);

  Color clrFontTextNew = const Color(0xff8E99AA);
  Color clrFontTextPrimary = const Color(0xff374D70);

  //Cart
  Color clrFontCart = const Color(0xff4A4949);
  Color clrCartItemBorder = const Color(0xffB9BFC8);
  Color clrGreenLight = const Color(0xff46C697);

  Color clrGreyCardBg = const Color(0xffDCDCDC);

  Color clrBaseGrey = const Color(0xffA2A2A2);
  Color clrHighlightGrey = Colors.grey.shade100;

  Color clrDarkBlue = const Color(0xff0D2854);
  Color clrGrayBG = const Color(0xffFAFBFB);

  Color clrRed = const Color(0xffF35353);
  Color clrRedNew = const Color(0xffD83030);
  Color clrReceiveBg = const Color(0xffE3E3E3);

  ///colors for contactus module add by vandan
  Color clrPadding = const Color(0xffCF283B);
  Color clrAcknowledge = const Color(0xffFFC300);
  Color clrResolved = const Color(0xff1AB23E);
  Color clrParrotGreen = const Color(0xff6AA045);
  Color clrDialogTitle = const Color(0xff282828);

  ///colors for notification screen add by vandan
  Color clrNotificationDelete = const Color(0xff171717);


/*
  * ------------------------ FontStyle ----------------------------------------- *
  * */
  String fontFamily = "Manrope";

  FontWeight fwThin = FontWeight.w100;
  FontWeight fwExtraLight = FontWeight.w200;
  FontWeight fwLight = FontWeight.w300;
  FontWeight fwRegular = FontWeight.w400;
  FontWeight fwMedium = FontWeight.w500;
  FontWeight fwSemiBold = FontWeight.w600;
  FontWeight fwBold = FontWeight.w700;
  FontWeight fwExtraBold = FontWeight.w800;

/*
  * ------------------------ Texts ----------------------------------------- *
  * */

  /*
  * ------------------------ Lottie ----------------------------------------- *
  * */

  static String lottiePath = 'assets/lottie_animations/';

  String lottieSuggestion = "${lottiePath}lottie_Suggestion.json";


/*
 * ----------------------------- Images---------------------------------------- *
 */

  static String assets = 'assets/images/';


  String icBack = '${assets}ic_back.png';
  String icAppIcon = '${assets}ic_app_logo.png';
  String icAppIconWhite = '${assets}ic_app_logo_white.png';
  String icDrawerMenu = '${assets}ic_drawer.png';
  String icMenu = '${assets}menu.svg';
  String icSearch = '${assets}ic_search.png';
  String icRight = "${assets}ic_right.png";
  String icPremium = "${assets}ic_premium.png";
  String icBackground = "${assets}ic_background.png";
  String icSuccess = "${assets}ic_success.png";
  String icSuccessLight = "${assets}ic_success_light.png";


  ///
  String icVeg = "${assets}ic_veg.png";
  String icNonVeg = "${assets}ic_non_veg.png";
  String icQuantity = "${assets}ic_quantity.png";
  String icDiscount = "${assets}ic_discount.png";
  String icDominoz = "${assets}ic_deminoz.png";
  String icInfo = "${assets}ic_info.png";
  String icStar = "${assets}ic_star.png";
  String icLike = "${assets}ic_like.png";
  String icAppBarBG = "${assets}ic_appbar_bg.png";
  String icAdd = "${assets}ic_add.png";
  String icNoOnionGarlic = "${assets}ic_no_onion_garlic.png";
  String icHome = "${assets}ic_home.png";
  String icCart = "${assets}ic_cart.png";
  String icOrder = "${assets}ic_order.png";
  String icProfile = "${assets}ic_profile.png";
  String icLikeFill = "${assets}ic_like_fill.png";
  String icDelete = "${assets}ic_delete.png";

}

class TextStyles {
  static TextStyle get txtRegular11 => TextStyle(
    color: Constant().clrTextMainFontByTheme(),
    fontSize: 11.sp,
    fontWeight: Constant().fwRegular,
    fontFamily: Constant().fontFamily,
  );
  static TextStyle get txtNormal12 => TextStyle(
        color: Constant().clrTextMainFontByTheme(),
        fontSize: 12.sp,
        fontWeight: Constant().fwMedium,
        fontFamily: Constant().fontFamily,
      );
  static TextStyle get txtRegular12 => TextStyle(
        color: Constant().clrTextMainFontByTheme(),
        fontSize: 12.sp,
        fontWeight: Constant().fwRegular,
        fontFamily: Constant().fontFamily,
      );
  static TextStyle get txtRegular13 => TextStyle(
    color: Constant().clrTextMainFontByTheme(),
    fontSize: 13.sp,
    fontWeight: Constant().fwRegular,
    fontFamily: Constant().fontFamily,
  );
  static TextStyle get txtNormal14 => TextStyle(
        color: Constant().clrTextMainFontByTheme(),
        fontSize: 14.sp,
        fontWeight: Constant().fwMedium,
        fontFamily: Constant().fontFamily,
      );
  static TextStyle get txtRegular14 => TextStyle(
        color: Constant().clrTextMainFontByTheme(),
        fontSize: 14.sp,
        fontWeight: Constant().fwRegular,
        fontFamily: Constant().fontFamily,
      );
  static TextStyle get txtRegular15 => TextStyle(
        color: Constant().clrTextMainFontByTheme(),
        fontSize: 15.sp,
        fontWeight: Constant().fwRegular,
        fontFamily: Constant().fontFamily,
      );
  static TextStyle get txtNormal16 => TextStyle(
        color: Constant().clrTextMainFontByTheme(),
        fontSize: 16.sp,
        fontWeight: Constant().fwMedium,
        fontFamily: Constant().fontFamily,
      );
  static TextStyle get txtRegular16 => TextStyle(
        color: Constant().clrTextMainFontByTheme(),
        fontSize: 16.sp,
        fontWeight: Constant().fwRegular,
        fontFamily: Constant().fontFamily,
      );
  static TextStyle get txtRegular17 => TextStyle(
        color: Constant().clrTextMainFontByTheme(),
        fontSize: 17.sp,
        fontWeight: Constant().fwRegular,
        fontFamily: Constant().fontFamily,
      );
  static TextStyle get txtHeader25 => TextStyle(
        color: Constant().clrTextMainFontByTheme(),
        fontSize: 25.sp,
        fontWeight: Constant().fwMedium,
        fontFamily: Constant().fontFamily,
      );
  static TextStyle get txtHeader18 => TextStyle(
        color: Constant().clrTextMainFontByTheme(),
        fontSize: 18.sp,
        fontWeight: Constant().fwMedium,
        fontFamily: Constant().fontFamily,
      );
  static TextStyle get txtNormal9 => TextStyle(
        color: Constant().clrTextLightGreyByTheme(),
        fontSize: 9.sp,
        fontWeight: Constant().fwRegular,
        fontFamily: Constant().fontFamily,
      );
  static TextStyle get txtNormal8 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 8.sp,
      fontWeight: Constant().fwMedium,
      fontFamily: Constant().fontFamily);

  static TextStyle get txtBold14 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 14.sp,
      fontWeight: Constant().fwBold,
      fontFamily: Constant().fontFamily);

  static TextStyle get txtBold15 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 15.sp,
      fontWeight: Constant().fwBold,
      fontFamily: Constant().fontFamily);

  static TextStyle get txtBold16 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 16.sp,
      fontWeight: Constant().fwBold,
      fontFamily: Constant().fontFamily);

  static TextStyle get txtRegular18 => TextStyle(
    color: Constant().clrTextMainFontByTheme(),
    fontSize: 18.sp,
    fontWeight: Constant().fwRegular,
    fontFamily: Constant().fontFamily,
  );

  static TextStyle get txtMedium10 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 10.sp,
      fontWeight: Constant().fwMedium,
      fontFamily: Constant().fontFamily);
  static TextStyle get txtMedium12 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 12.sp,
      fontWeight: Constant().fwMedium,
      fontFamily: Constant().fontFamily);
  static TextStyle get txtMedium13 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 13.sp,
      fontWeight: Constant().fwMedium,
      fontFamily: Constant().fontFamily);

  static TextStyle get txtMedium14 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 14.sp,
      fontWeight: Constant().fwMedium,
      fontFamily: Constant().fontFamily);


  static TextStyle get txtMedium16 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 16.sp,
      fontWeight: Constant().fwMedium,
      fontFamily: Constant().fontFamily);

  static TextStyle get txtMedium18 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 18.sp,
      fontWeight: Constant().fwMedium,
      fontFamily: Constant().fontFamily);

  static TextStyle get txtMedium20 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 20.sp,
      fontWeight: Constant().fwMedium,
      fontFamily: Constant().fontFamily);

  static TextStyle get txtSemiBold12 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 12.sp,
      fontWeight: Constant().fwSemiBold,
      fontFamily: Constant().fontFamily);

  static TextStyle get txtBold12 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 12.sp,
      fontWeight: Constant().fwBold,
      fontFamily: Constant().fontFamily);

  static TextStyle get txtSemiBold14 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 14.sp,
      fontWeight: Constant().fwSemiBold,
      fontFamily: Constant().fontFamily);

  static TextStyle get txtSemiBold18 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 18.sp,
      fontWeight: Constant().fwSemiBold,
      fontFamily: Constant().fontFamily);

  static TextStyle get txtBold18 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 18.sp,
      fontWeight: Constant().fwBold,
      fontFamily: Constant().fontFamily);

  static TextStyle get txtBold22 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 22.sp,
      fontWeight: Constant().fwSemiBold,
      fontFamily: Constant().fontFamily);

  static TextStyle get txtBold20 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 20.sp,
      fontWeight: Constant().fwSemiBold,
      fontFamily: Constant().fontFamily);

  static TextStyle get txtExtraBold25 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 25.sp,
      fontWeight: Constant().fwExtraBold,
      fontFamily: Constant().fontFamily);


  static TextStyle get txtLight15 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 15.sp,
      fontWeight: Constant().fwLight,
      fontFamily: Constant().fontFamily);

  static TextStyle get txtLight12 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 12.sp,
      fontWeight: Constant().fwLight,
      fontFamily: Constant().fontFamily);

  static TextStyle get txtLight14 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 14.sp,
      fontWeight: Constant().fwLight,
      fontFamily: Constant().fontFamily);



  static TextStyle get txtBold25 => TextStyle(
      color: Constant().clrTextMainFontByTheme(),
      fontSize: 25.sp,
      fontWeight: Constant().fwBold,
      fontFamily: Constant().fontFamily);
}
