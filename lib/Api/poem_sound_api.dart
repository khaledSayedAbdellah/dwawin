
import 'dart:developer';

import 'package:dwawin/Database/db_media_table.dart';

import '../Models/media_model.dart';
import '../Utilities/api_helper.dart';
import '../Utilities/toast_helper.dart';

class PoemApi{

  static Future<List<MediaModel>> getMediaByPoemId({required int? poemId})async{
    if(poemId == null) return [];
    var response = await API.getRequest(url: API.poemMedia(poemId));
    if (response == null) return await MediaDbHelper().getByPoemId(poemId: poemId);
    log(response.toString());
    if (response["status"] == true) {
      List<MediaModel> data = List.from(response["data"].map((e)=> MediaModel.fromMap(e)));
      data.forEach((m) async{
        await MediaDbHelper().insert(media: m);
      });
      return data;
    } else {
      return  await MediaDbHelper().getByPoemId(poemId: 1);
    }
  }
}