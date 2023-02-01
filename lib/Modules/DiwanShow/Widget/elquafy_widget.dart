import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Utilities/theme_helper.dart';
class ElquafyWidget extends StatelessWidget {
  final List<String>elquafi;
  const ElquafyWidget({Key? key, required this.elquafi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: SizedBox(
          width: 1025.w,
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/ic_2squaer.svg",
                    height: 150.w,
                    width: 150.w,
                  ),
                  Text("Rhymes".tr,style: TextStyle(
                      fontSize: 40.sp,
                      color: ThemeClass.secondaryColor,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(width: 20.w,),
                  Expanded(child: Divider(height: 1.h,color: ThemeClass.secondaryColor,thickness: 2.h,))
                ],
              ),
              Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children: elquafi.map((e){
                  return Container(
                    alignment: Alignment.center,
                    width: 155.w,
                    height: 80.h,
                    decoration:  BoxDecoration(
                        borderRadius:BorderRadius.circular(20.w),
                        color: const Color(0xffE9E9E9)
                    ),
                    child: Text(e,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ThemeClass.primaryColor,
                    ),),
                  );
                }).toList(),)
            ],
          ),
        ),
      ),
    );
  }
}
