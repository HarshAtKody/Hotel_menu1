import 'package:flutter/material.dart';
import 'package:hotel_menu1/utils/theme_const.dart';

class Styles {

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Constant().colorPrimary,
      primaryColor: Constant().clrPrimary,
      scaffoldBackgroundColor: Constant().clrScaffoldBGByTheme(),
      backgroundColor: Constant().clrScaffoldBGByTheme(),

      hintColor: Constant().clrHintText,
      // buttonColor: Constant().clrTextByTheme(),
      textTheme: Theme.of(context).textTheme.apply(
        bodyColor: Constant().clrTextByTheme(),
      ),

      // buttonTheme: Theme.of(context).buttonTheme.copyWith(colorScheme: isDarkTheme ?
      // ColorScheme.dark(
      //   background: Constant().clrPrimary,
      // ) : ColorScheme.light(
      //     background: Constant().clrPrimary
      // )),

      // indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Colors.white,
      // buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Colors.white,
      //
      // hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
      //
      // highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      // hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      //
      // focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      // disabledColor: Colors.grey,
      // textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      // cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      // canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      // brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      // buttonTheme: Theme.of(context).buttonTheme.copyWith(colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: Constant().clrScaffoldBGByTheme(),
      ),
    );

  }
}