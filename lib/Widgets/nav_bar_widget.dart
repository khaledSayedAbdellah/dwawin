import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../Utilities/theme_helper.dart';
class NavBarWidget extends StatefulWidget {
  int? selectedIndex;
  final Function(int)? onChange;
  final Function()? openDrawer;
   NavBarWidget({Key? key,this.onChange, this.selectedIndex=0, this.openDrawer}) : super(key: key);

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  List<NavBarModel>itemIMage=[
    NavBarModel(imageName: "ic_home.svg",id: 0,title: "Home".tr),
    NavBarModel(imageName: "ic_dwawen.svg",id: 1,title: "Dawawin".tr),
    NavBarModel(imageName: "ic_ksaed.svg",id: 2,title: "Poems".tr),
    NavBarModel(imageName: "ic_shaikh.svg",id: 3,title: "about__sheikh".tr),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(bottom: 50.h,top: 50.h,end: 60.w,start: 60.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft:Radius.circular(80.w) ,topRight: Radius.circular(80.w)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8.w,
              iconSize: 90.w,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: ThemeClass.primaryColor,
              tabBorderRadius: 20.w,
              textStyle: TextStyle(
                  fontSize:36.sp ,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
              tabs: itemIMage.map((e) {
                return GButton(
                  icon: Icons.home,
                  leading: SvgPicture.asset(
                    "assets/images/${e.imageName}",
                    color: widget.selectedIndex==e.id?Colors.white:Colors.grey,
                    height: 96.h,
                    width: 96.w,
                  ),
                  text: e.title,
                );
              }).toList(),
              selectedIndex: widget.selectedIndex??0,
              onTabChange: widget.onChange,
              activeColor: ThemeClass.backGround,
            ),
          ),
          SizedBox(width: 30.w,),
          GestureDetector(onTap: widget.openDrawer,child: Icon(Icons.more_vert_sharp,color: Colors.grey,)),
        ],
      ),
    );
  }
}
class NavBarModel{
  String imageName;
  int id;
  String title;
  NavBarModel({required this.imageName,required this.id,required this.title});
}