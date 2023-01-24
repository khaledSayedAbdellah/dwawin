import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../locale/locales.dart';
import 'LayoutHelper/show_images.dart';

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
extension translateEx on String {
  String get tr => AppLocalizations.instance.translate(this)??"";
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
}