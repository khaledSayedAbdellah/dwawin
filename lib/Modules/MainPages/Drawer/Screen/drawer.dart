import 'package:dwawin/Utilities/helper.dart';
import 'package:dwawin/Utilities/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../Controller/drawer_controller.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State createState() => _DrawerScreenState();
}

class _DrawerScreenState extends StateMVC<DrawerScreen> {
  _DrawerScreenState():super(DrawersController()){
    con=DrawersController();
  }
  late DrawersController con;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 923.w,
      child: Stack(
        children: [
          SvgPicture.asset(
            "assets/images/BG.svg",
            fit: BoxFit.cover,
            // height: double.infinity,
          ),
          ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                    color: ThemeClass.primaryColor,
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/orn-header-home.png"))),
                child:  Image.asset(
                  "assets/images/icon_circle.png",
                  fit: BoxFit.contain,
                  // height: double.infinity,
                ),
              ),
              Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: con.drawerList.map((e) {
                  return  InkWell(
                    splashColor: ThemeClass.primaryColor.withOpacity(.6),
                    highlightColor: ThemeClass.primaryColor.withOpacity(.6),
                    onTap: ()=>con.onTapFunction(context: context, model: e),
                    child: ListTile(
                      trailing:e.id==3? Text(con.selectLanguage==0?"عربي  >":"En  >",style: TextStyle(
                          fontSize: 41.sp,
                          fontWeight: FontWeight.w500,
                          color: ThemeClass.thirdColor
                      ),):const SizedBox(),
                      title:  Text(e.title?.tr??'',style: TextStyle(
                        fontSize: 41.sp,
                        fontWeight: FontWeight.w500,
                        color: ThemeClass.thirdColor
                      ),),
                      minLeadingWidth: -10.w,
                      contentPadding: EdgeInsetsDirectional.only(start: 80.w,end: 35.w),
                      leading: SvgPicture.asset(
                        "assets/images/${e.image}",
                        height: 100.h,
                        width: 100.w,
                        fit: BoxFit.cover,
                        // height: double.infinity,
                      ),
                    ),
                  );
                }).toList(),
              )

            ],
          ),
        ],
      ),
    );
  }
}
