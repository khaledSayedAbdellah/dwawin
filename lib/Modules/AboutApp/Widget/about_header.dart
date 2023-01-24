import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Utilities/theme_helper.dart';
import '../../../../Widgets/custome_text_filed.dart';
class AboutAppHeaderWidget extends StatelessWidget {
  final TextEditingController searchController;
  const AboutAppHeaderWidget({Key? key, required this.searchController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      snap: true,
      floating: true,
      expandedHeight: 540.h,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace:  FlexibleSpaceBar(
        background: Stack(
          children: [
            Container(
              height: 450.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ThemeClass.primaryColor,
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/orn-header-home.png")
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80.w), bottomRight: Radius.circular(80.w)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      width: 1025.w,
                      child: Text("about_app".tr,style: TextStyle(
                          fontSize: 38.sp,
                          fontWeight:FontWeight.bold ,color: Colors.white
                      ),),
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  Center(
                    child: SizedBox(
                      width: 1025.w,
                      child: Text("about_app_des".tr,style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight:FontWeight.w500 ,
                          color: const Color(0xffDEDEDE),
                      ),),
                    ),
                  ),
                  SizedBox(height: 40.h,),
                ],
              ),
            ),
            Positioned(
              bottom:30.h,
              left: 0,
              right: 0,
              child: Center(
                child: CustomTextFieldWidget(
                  controller: searchController,
                  prefixIcon: Icon(Icons.search_sharp,color: ThemeClass.darkGray,),
                  backGroundColor: Colors.white,
                  borderColor: Colors.white,
                  borderRadiusValue: 25.w,
                  hint:"search".tr,
                  activeBorderColor:Colors.white,
                  hintStyle: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    color: ThemeClass.darkGray,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
