import 'dart:io';

import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../../Utilities/theme_helper.dart';
import '../Controller/about_us_controller.dart';
import '../Widget/about_header_widget.dart';
import '../Widget/content_design_widget.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State createState() => _AboutUsState();
}

class _AboutUsState extends StateMVC<AboutUs> {
  _AboutUsState() : super(AboutUsController()) {
    con = AboutUsController();
  }

  late AboutUsController con;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (Platform.isAndroid) SystemNavigator.pop();
          exit(0);
        },
        child: Scaffold(
            backgroundColor: ThemeClass.backGround,
            body: Stack(children: [
              SvgPicture.asset(
                "assets/images/BG.svg",
                fit: BoxFit.cover,
                // height: double.infinity,
              ),
              CustomScrollView(slivers: [
                AboutUsHeaderWidget(searchController: con.searchController),
                SliverToBoxAdapter(child: SizedBox(height: 60.h,),),
                SliverToBoxAdapter(
                  child: Center(
                    child: SizedBox(
                      width: 1025.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(child: ContentDesignWidget(title:"his_birth".tr ,dec: "his_birth_dec".tr)),
                          SizedBox(width: 50.w,),
                          Image.asset("assets/images/img-shikh.png",width: 310.w,height: 407.h,),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 60.h,),),
                SliverToBoxAdapter(
                  child: Center(
                    child: SizedBox(
                      width: 1025.w,
                      child:ContentDesignWidget(title:"his_elders".tr ,dec: "his_elders_dec".tr),
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 60.h,),),
                SliverToBoxAdapter(
                  child: Center(
                    child: SizedBox(
                      width: 1025.w,
                      child:ContentDesignWidget(title:"scholars_leave_him".tr ,dec: "scholars_leave_him_dec".tr),
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 30.h,),),
              ])
            ])));
  }
}
