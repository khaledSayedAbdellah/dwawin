import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Utilities/theme_helper.dart';
class ContentDesignWidget extends StatelessWidget {
  final String title;
  final String dec;
  const ContentDesignWidget({Key? key, required this.title, required this.dec}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(
            fontWeight:FontWeight.bold ,
            fontSize: 38.sp,
            color: ThemeClass.secondaryColor
        ),),
        Divider(color: ThemeClass.primaryColor,thickness: 1.h,),
        Text(dec,style: TextStyle(
            fontWeight:FontWeight.w500,
            fontSize: 23.sp,
            color: ThemeClass.fourthDarkGray
        ),),
      ],
    );
  }
}
