import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:path_provider/path_provider.dart';
import '../locale/locales.dart';
import 'LayoutHelper/show_images.dart';
import 'api_helper.dart';

extension OnTapImageExtension on Image {
  Widget showOnTap(){
    return InkWell(
      onTap: (){
        Modular.to.push(MaterialPageRoute(builder: (_)=> ShowImagesWidget(
          images: const [],
          image: image,
        )));
      },
      child: this,
    );
  }
}
extension OnTapFadeImageExtension on FadeInImage {
  Widget showOnTap(){
    return InkWell(
      onTap: (){
        Modular.to.push(MaterialPageRoute(builder: (_)=> ShowImagesWidget(
          images: const [],
          image: image,
        )));
      },
      child: this,
    );
  }
}
// ignore: camel_case_extensions
extension translate on String {
  String get tr => AppLocalizations.instance.translate(this)??"";
}

extension removeArabicFormation on String {
  String rmArFormation(){
    List<int> data = this.codeUnits.toList();
    // const List<String> arabicFormationsTypes = ["ُ","َ","ِ","ّْ","ً","ٌ","ٍ"];
    // List<int> asciFormationsCode = arabicFormationsTypes.map((e) => e.codeUnits.first).toList();
    const List<int> asciFormationsCode = const [1615, 1614, 1616, 1618, 1611, 1612, 1613];
    data.removeWhere((item) => asciFormationsCode.contains(item));
    return String.fromCharCodes(data);
  }
}



class Helper{
  static final formatter = DateFormat('yyyy-MM-dd');

  static final formatterCustom = DateFormat('yyyy MMM dd');
  static final formatterCustomTime = DateFormat('hh : mm a');
  static String  getTimeZone(DateTime dateTime) =>DateFormat.jm().format(dateTime);

  static const String imagePlaceHolder = "https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png";
  static showBottomSheetWithDynamicHeight({
    required BuildContext context,
    required Widget widget,
    Function? onDismiss,
  }) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.w))),
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context)=> widget,).then((_) {
      if (onDismiss != null) onDismiss();
    });
  }

  static Future<String> getChatFolderPath()async{
    String folderName = "chat";
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    final Directory newDirectory = Directory('$appDocumentsPath/$folderName/');
    return (await newDirectory.create(recursive: true)).path;
  }

  static Future<File?> getAndDownloadEquitableFile({String? filePath,bool canDownload = false})async{
    if(filePath == null) return null;

    String createdFileName = filePath.split("/").last;


    String folderPath = await getChatFolderPath();
    final allFiles = Directory(folderPath).listSync();
    for (FileSystemEntity file in allFiles) {
      if(file.path.contains(createdFileName)) return File(file.path);
    }
    if(!canDownload) return null;

    Uint8List? downloadedData = await API.getDataFromUrl(url: filePath);
    if(downloadedData == null) return null;
    return File("$folderPath/$createdFileName")..writeAsBytesSync(downloadedData);
  }



}