import 'dart:convert';
import 'dart:io';
import 'package:dwawin/Database/db_poem_table.dart';
import 'package:dwawin/Models/diwan_model.dart';
import 'package:dwawin/Models/poem_model.dart';
import 'package:dwawin/Utilities/helper.dart';
import 'package:dwawin/Utilities/shared_preferances_helper.dart';
import 'package:flutter/services.dart';
import '../Database/db_diwan_table.dart';
import '../Database/db_verse_table.dart';
import '../Models/shikh_data_model.dart';

class InitialLocalData{

  static int appDataVersion = 8;

  static Future<void> init()async{
    bool needToUpdate = _checkDataNeedToUpdate();
    if(!needToUpdate) return;
    await _saveSoundImage();
    Map<String, dynamic> data = await _parseJsonFromAssets('assets/data.json');
    List<PoemModel> poems = List.from(data["poems"].map((e) => PoemModel.fromMap(e)));
    List<DiwanModel> dwawin = List.from(data["dwawin"].map((e) => DiwanModel.fromMap(e)));

    poems.forEach((item) async=> await PoemDbHelper().insert(poem: item));
    dwawin.forEach((item) async=> await DiwanDbHelper().insertWithoutNofPoems(diwan: item));

    poems.forEach((poem) {
      poem.content.forEach((verse) async {
        print(verse.toMap());
        await VerseDbHelper().insert(verse: verse);
      });
    });
    await SharedPref.setDataVersion(version: appDataVersion);
  }

  static Future _saveSoundImage()async{
    ByteData bytes = await rootBundle.load("assets/images/home_banar.png");
    String mediaFolder = await Helper.getMediaFolderPath();
    File("$mediaFolder/sound_banner.png")..writeAsBytesSync( bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
  }

  static Future<Map<String, dynamic>> _parseJsonFromAssets(String assetsPath) async {
    return rootBundle.loadString(assetsPath).then((jsonStr) => jsonDecode(jsonStr));
  }

  static bool _checkDataNeedToUpdate(){
    int lastVersion = SharedPref.getDataVersion()??0;
    return lastVersion < appDataVersion;
  }

  static Future<ShikhDataModel> getShikhData()async{
    Map<String, dynamic> data = await _parseJsonFromAssets('assets/shikh_data.json');
    return ShikhDataModel.fromMap(data);
  }
}