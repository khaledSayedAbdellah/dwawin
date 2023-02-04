import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utilities/theme_helper.dart';
class AboutDiwan extends StatelessWidget {
  final String aboutDiwan;

  const AboutDiwan({Key? key, required this.aboutDiwan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Container(
          padding: EdgeInsetsDirectional.only(start: 40.w,end: 40.w,top: 45.h,bottom: 60.h),
          width: 1025.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.w),

          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text("about_diwan".tr,style: TextStyle(
                      fontSize: 40.sp,
                      color: ThemeClass.primaryColor,
                      fontWeight: FontWeight.w500
                  ),),

                  SizedBox(width: 4.w,),
                  Expanded(child: Divider(color: const Color.fromRGBO(145, 105, 99, 1),thickness: 1.h,)),
                ],),
              SizedBox(height: 21.w,),
              Text(aboutDiwan,style: TextStyle(
                  fontSize: 24.sp,
                  color: const Color.fromRGBO(104, 104, 104, 1),
                  fontWeight: FontWeight.w500
              ),),
            ],
          ),

        ),
      ),
    );
  }
}
