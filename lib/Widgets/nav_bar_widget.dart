import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../Utilities/theme_helper.dart';
class NavBarWidget extends StatefulWidget {
  int? selectedIndex;
  final Function(int)? onChange;
   NavBarWidget({Key? key,this.onChange, this.selectedIndex=0}) : super(key: key);

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  List<NavBarModel>itemIMage=[
    NavBarModel(imageName: "ic_home.svg",id: 0,title: "Home"),
    NavBarModel(imageName: "ic_dwawen.svg",id: 1,title: "Dawawin"),
    NavBarModel(imageName: "ic_ksaed.svg",id: 2,title: "Poems"),
    NavBarModel(imageName: "ic_shaikh.svg",id: 3,title: "about__sheikh"),
    NavBarModel(imageName: "ic_more.svg",id: 4,title: "More"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.h,horizontal: 80.w),
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
            text: e.title.tr,
          );
        }).toList(),
        selectedIndex: widget.selectedIndex??0,
        onTabChange:widget.onChange,
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