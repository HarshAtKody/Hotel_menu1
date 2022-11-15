import 'package:flutter/cupertino.dart';
import 'package:hotel_menu1/utils/const.dart';
import 'package:hotel_menu1/utils/theme_const.dart';

class DarkModeController with ChangeNotifier, Constant {
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  void updateIsDarkMode(bool fromSetting, bool value) {
    if(fromSetting){
      saveLocalData(KEY_APP_THEME_DARK, value);
    }
    _darkTheme = value;
    isDarkMode = _darkTheme;
    notifyListeners();
  }
}