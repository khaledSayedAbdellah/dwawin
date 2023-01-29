import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Models/eldawawin_model.dart';
import '../../../../Utilities/theme_helper.dart';
import 'package:dwawin/Utilities/helper.dart';

class EldawawinListDesign extends StatelessWidget {
  final EldawawinModel eldawawin;
  const EldawawinListDesign({Key? key, required this.eldawawin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin:EdgeInsets.symmetric(vertical: 19.h),
        padding: EdgeInsetsDirectional.only(top: 46.h,bottom: 26.h,start: 22.w,end: 22.w),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.w)
        ),
        width: 1025.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/images/dawawin_icon.svg",
                  height: 80.h,
                  width: 70.w,
                  color: ThemeClass.primaryColor,
                ),
                Text(eldawawin.title!.tr,style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: ThemeClass.primaryColor
                ),),
              ],
            ),
            SizedBox(height: 33.h,),
            Row(
              children: [
                SizedBox(width:60.w ,),
                Text('num_of_poems'.tr,style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w500,
                    color: ThemeClass.secondaryColor
                ),),
                SizedBox(width: 11.w,),
                Text("${eldawawin.numberOfPoems.toString()}  ${"poems".tr}",style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: ThemeClass.secondaryColor
                ),),
              ],
            ),
            SizedBox(height: 28.h,),
          ],
        ),
      ),
    );
  }
}