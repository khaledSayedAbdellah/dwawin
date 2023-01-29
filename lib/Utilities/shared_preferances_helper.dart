import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class SharedPref{
  // singleton
  factory SharedPref(){
    _this ??= SharedPref._();
    return _this!;
  }
  static SharedPref? _this;
  SharedPref._();


  static SharedPreferences? prefs;

  static const String _language = "language_code";
  static const String _dataVersion = "data_version";

  init()async{
    prefs = await SharedPreferences.getInstance();
  }


  static int? getDataVersion(){
    return prefs?.getInt(_dataVersion);
  }
  static Future<void> setDataVersion({required int version})async{
    await prefs?.setInt(_dataVersion,version);
  }

  static String? getCurrentLang(){
    return prefs?.getString(_language);
  }
  static Future<void> setCurrentLang({required String lang})async{
    await prefs?.setString(_language,lang);
  }
}