import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main_screens.dart';
class AudiblePoemsWidget extends StatelessWidget {
  const AudiblePoemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(MainScreen.routeName,arguments: 1);

        },
        child: Center(
          child: Container(
            padding: EdgeInsetsDirectional.only(
                start: 110.w, end: 46.w, top: 55.h, bottom: 42.h),
            height: 545.h,
            width: 1025.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.w),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image:
                    AssetImage("assets/images/home_banar.png"))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "audible_poems".tr,
                  style: TextStyle(
                      fontSize: 38.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 32.h,),
                Text(
                  "madh_alrasul".tr,
                  style: TextStyle(
                      fontSize: 38.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.normal
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sheikh".tr,
                      style: TextStyle(
                          fontSize: 38.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    Icon(Icons.play_circle_outline,size: 99.w,color: Colors.white,),
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
