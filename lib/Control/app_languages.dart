import 'package:flutter/material.dart';

import '../Utilities/shared_preferances_helper.dart';


class AppLanguage extends ChangeNotifier {
  Locale? _appLocale = const Locale("en");

  Locale get appLocal => _appLocale ?? const Locale("en");

  fetchLocale() async {
    if (SharedPref.getCurrentLang() == null) {
      _appLocale = const Locale("en");
      return Null;
    }
    _appLocale = Locale(SharedPref.getCurrentLang() ?? "ar");
    return Null;
  }

  Future changeLanguage(Locale? type) async {
    if (_appLocale == type) {
      return;
    }
    if (type == null) {
      if (_appLocale == const Locale("ar")) {
        _appLocale = const Locale("en");
        await SharedPref.setCurrentLang(lang: "en");
      } else {
        _appLocale = const Locale("ar");
        await SharedPref.setCurrentLang(lang: "ar");
      }
      notifyListeners();
    } else {
      if (type == const Locale("ar")) {
        _appLocale = const Locale("ar");
        await SharedPref.setCurrentLang(lang: "ar");
      } else {
        _appLocale = const Locale("en");
        await SharedPref.setCurrentLang(lang: "en");
      }
      notifyListeners();
    }
  }
}
