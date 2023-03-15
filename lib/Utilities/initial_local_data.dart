import 'dart:convert';
import 'dart:io';
import 'package:dwawin/Database/db_poem_table.dart';
import 'package:dwawin/Models/diwan_model.dart';
import 'package:dwawin/Models/poem_model.dart';
import 'package:dwawin/Models/verse_model.dart';
import 'package:dwawin/Utilities/helper.dart';
import 'package:dwawin/Utilities/shared_preferances_helper.dart';
import 'package:flutter/services.dart';
import '../Database/db_diwan_table.dart';
import '../Database/db_verse_table.dart';
import '../Models/shikh_data_model.dart';
import '../generated/assets.dart';

class InitialLocalData{

  static int appDataVersion = 9;

  static Future<void> init()async{
    bool needToUpdate = _checkDataNeedToUpdate();
    if(!needToUpdate) return;
    await _saveSoundImage();


    await _saveDwawin();

    // save poems dwawin
    for(int i=1; i<= 20; i++){
      List? data = await _parseJsonFromAssets('assets/data/dwawin/$i.json');
      if(data != null){
        await _savePoems(List<PoemModel>.from(data.map((e) => PoemModel.fromMap(e))).toList());
      }
    }

    // save poems knash
    for(int i=15; i<= 35; i++){
      List? data = await _parseJsonFromAssets('assets/data/knash/$i.json');
      if(data != null){
        await _savePoems(List<PoemModel>.from(data.map((e) => PoemModel.fromMap(e))).toList());
      }
    }

    await SharedPref.setDataVersion(version: appDataVersion);
  }

  static Future _saveDwawin()async{
    List data = await _parseJsonFromAssets(Assets.dataDwawin);
    List<DiwanModel> allDwawin = data.map((e) => DiwanModel.fromMap(e)).toList();
    for(DiwanModel diwan in allDwawin){
     await DiwanDbHelper().insert(diwan: diwan);
    }
  }

  static Future _savePoems(List<PoemModel> poems)async{
    for(PoemModel poem in poems){
      await PoemDbHelper().insert(poem: poem);
      for(VerseModel verse in poem.content){
        await VerseDbHelper().insert(verse: verse);
      }
    }
  }

  static Future _saveSoundImage()async{
    ByteData bytes = await rootBundle.load("assets/images/home_banar.png");
    String mediaFolder = await Helper.getMediaFolderPath();
    File("$mediaFolder/sound_banner.png")..writeAsBytesSync( bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
  }

  static Future _parseJsonFromAssets(String assetsPath) async {
    try{
      String data = await rootBundle.loadString(assetsPath);
      return jsonDecode(data);
    }catch(e){
      return null;
    }
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