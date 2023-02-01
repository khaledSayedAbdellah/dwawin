import 'package:dwawin/Modules/MainPages/main_screens.dart';
import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Utilities/theme_helper.dart';
class EldawawinShowAll extends StatelessWidget {
  const EldawawinShowAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child:
    Center(
      child: Container(
        padding: EdgeInsetsDirectional.only(top: 66.h,bottom: 20.h),
        width: 980.w,
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/images/dawawin_icon.svg",
              height: 80.h,
              width: 70.w,
            ),
            Text("Dawawin".tr,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.sp,
                color: ThemeClass.secondaryColor
            ),),
            SizedBox(width: 48.w,),
            Flexible(child: Divider(color: ThemeClass.secondaryColor,height: 1.h)),
            SizedBox(width: 26.w,),
            InkWell(
              onTap: ()=>Navigator.of(context).pushNamed(MainScreen.routeName,arguments: 1),
              child: Text("show_all".tr,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.sp,
                  color: ThemeClass.primaryColor
              ),),
            ),
          ],),
      ),
    ),);
  }
}
