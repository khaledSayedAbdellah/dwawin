import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Models/poem_model.dart';
import '../Modules/PomesShow/Screen/poems_show.dart';
import '../Utilities/theme_helper.dart';
class PoemsWidget extends StatelessWidget {
  final PoemModel poem;
  const PoemsWidget({Key? key, required this.poem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.of(context).pushNamed(PoemsShow.routeName,arguments:poem),
      child: Center(
        child: Container(
          margin:EdgeInsets.symmetric(vertical: 19.h),
          padding: EdgeInsetsDirectional.only(top: 46.h,bottom: 26.h,start: 22.w,end: 22.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.w),
              boxShadow: [
                BoxShadow(
                  color: Color(0xF6EDAF99).withOpacity(0.3),
                  blurRadius: 0,
                  offset: Offset(0,3.w),
                )
              ]
          ),
          width: 1025.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/book.svg",
                    height: 80.h,
                    width: 70.w,
                  ),
                  Text(poem.name??'',style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: ThemeClass.primaryColor
                  ),),
                ],
              ),
              SizedBox(height: 31.h,),
              Center(
                child: SizedBox(
                  width: 800.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(poem.content.first.verse1??"",style: TextStyle(
                            fontSize: 29.sp,
                            fontWeight: FontWeight.w500,
                            color: ThemeClass.secondDarkGray
                        ),),
                      ),  Flexible(
                        child: Text(poem.content.first.verse2??"",style: TextStyle(
                            fontSize: 29.sp,
                            fontWeight: FontWeight.w500,
                            color: ThemeClass.secondDarkGray
                        ),),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 28.h,),
            ],
          ),
        ),
      ),
    );
  }
}
