import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Utilities/theme_helper.dart';
import '../Controller/about_app_controller.dart';
import '../Widget/about_header.dart';


class AboutApp extends StatefulWidget {
  static const routeName = "/AboutApp";

  const AboutApp({Key? key}) : super(key: key);

  @override
  State createState() => _AboutAppState();
}

class _AboutAppState extends StateMVC<AboutApp> {
  _AboutAppState():super(AboutAppController()){
    con=AboutAppController();
  }
  late AboutAppController con;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            SvgPicture.asset(
              "assets/images/about_background.svg",
              fit: BoxFit.cover,
            ),
            SvgPicture.asset(
              "assets/images/BG.svg",
              fit: BoxFit.cover,
            ),
            CustomScrollView(
                physics: const NeverScrollableScrollPhysics(),
                slivers: [
                  AboutAppHeaderWidget(searchController: con.searchController),                  // SliverList(
                  SliverToBoxAdapter(
                    child: SizedBox(height: 130.h,),
                  ),
                  SliverToBoxAdapter(
                    child: Center(
                      child: SizedBox(
                        width: 1025.w,
                          child: Text("about_des_3".tr,style: TextStyle(
                            fontSize: 32.sp,
                            color:ThemeClass.fourthDarkGray ,
                            fontWeight: FontWeight.w500
                          ),)),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 140.h,),
                  ),
                  SliverToBoxAdapter(
                    child: Center(
                      child: SizedBox(
                          width: 1025.w,
                          child: Text("about_des_4".tr,style: TextStyle(
                              fontSize: 32.sp,
                              color:ThemeClass.fourthDarkGray ,
                              fontWeight: FontWeight.w500
                          ),)),
                    ),
                  ),
                ]),
          ],
        ));
  }
}
