
import 'dart:developer';

import '../Models/media_model.dart';
import '../Utilities/api_helper.dart';
import '../Utilities/toast_helper.dart';

class PoemApi{

  static Future<List<MediaModel>> getMediaByPoemId({required int poemId})async{
    var response = await API.getRequest(url: API.poemMedia(poemId));
    if (response == null) return [];
    log(response.toString());
    if (response["status"] == true) {
      return List.from(response["data"].map((e)=> MediaModel.fromMap(e)));
    } else {
      ToastHelper.showError(message: response["message"]);
      return [];
    }
  }
}