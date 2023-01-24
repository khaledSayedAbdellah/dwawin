import 'dart:convert';
import 'package:dwawin/Database/db_poem_table.dart';
import 'package:dwawin/Models/diwan_model.dart';
import 'package:dwawin/Models/poem_model.dart';
import 'package:dwawin/Utilities/shared_preferances_helper.dart';
import 'package:flutter/services.dart';
import '../Database/db_diwan_table.dart';

class InitialLocalData{

  static int appDataVersion = 3;

  static Future<void> init()async{
    bool needToUpdate = _checkDataNeedToUpdate();
    if(!needToUpdate) return;

    Map<String, dynamic> data = await _parseJsonFromAssets('assets/data.json');
    List<PoemModel> poems = List.from(data["poems"].map((e) => PoemModel.fromMap(e)));
    List<DiwanModel> dwawin = List.from(data["dwawin"].map((e) => DiwanModel.fromMap(e)));

    poems.forEach((item) async=> await PoemDbHelper().insert(poem: item));
    dwawin.forEach((item) async=> await DiwanDbHelper().insertWithoutNofPoems(diwan: item));
    await SharedPref.setDataVersion(version: appDataVersion);
  }

  static Future<Map<String, dynamic>> _parseJsonFromAssets(String assetsPath) async {
    return rootBundle.loadString(assetsPath).then((jsonStr) => jsonDecode(jsonStr));
  }

  static bool _checkDataNeedToUpdate(){
    int lastVersion = SharedPref.getDataVersion()??0;
    return lastVersion < appDataVersion;
  }
}