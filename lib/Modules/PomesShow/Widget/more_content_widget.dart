import 'package:dwawin/Utilities/helper.dart';
import 'package:dwawin/Utilities/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../Control/shared_data_provider.dart';
import 'add_note_alert_widget.dart';

class MoreContentWidget extends StatefulWidget {
  final Function(BuildContext context) addNote,addFavorite,playWithOutInternet,sharePoem;
   bool isFavorite;
   MoreContentWidget({Key? key, required this.addNote, required this.addFavorite, required this.playWithOutInternet, required this.sharePoem, this.isFavorite=false}) : super(key: key);

  @override
  State<MoreContentWidget> createState() => _MoreContentWidgetState();
}

class _MoreContentWidgetState extends State<MoreContentWidget> {
  int selectBackGroundColor=0;
  int selectFontColor=0;
  List<MoreModel> get moreButton => [
    MoreModel(id: 0, title: "fav", image:widget.isFavorite==true? "ic_add_fav.svg":"ic_fav_color.svg",onTap: widget.addFavorite),
    MoreModel(id: 1, title: "add_note", image: "ic_add_comment.svg",onTap: widget.addNote),
    MoreModel(
        id: 2, title: "play_with_out_internet", image: "ic_downlod_setting.svg",onTap: widget.playWithOutInternet),
    MoreModel(id: 3, title: "share_poems", image: "ic_share_set.svg",onTap:widget.sharePoem),
  ];
  List<MoreModel> fontColor = [
    MoreModel(id: 0, color: const Color(0xff000000)),
    MoreModel(id: 1, color: const Color(0xff1BA486)),
    MoreModel(id: 2, color: const Color(0xff0F264C)),
    MoreModel(id: 3, color: const Color(0xff047E63)),
    MoreModel(id: 4, color: const Color(0xff51DECF)),
  ];
  List<MoreModel> backGroundColor = [
    MoreModel(id: 0, color: const Color(0xffFFFFFF)),
    MoreModel(id: 1, color: const Color(0xffFFF8E9)),
    MoreModel(id: 2, color: const Color(0xffDFDFDF)),
    MoreModel(id: 3, color: const Color(0xffE6DBD0)),
    MoreModel(id: 4, color: const Color(0xffDCEDF1)),
  ];
  List<MoreModel> setFontSize = [
    MoreModel(id: 0, color: Colors.white,icon: Icons.add),
    MoreModel(id: 1, color: ThemeClass.primaryColor,icon: CupertinoIcons.equal),
    MoreModel(id: 2, color: Colors.white,icon: Icons.remove),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1025.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(2000.w), topRight: Radius.circular(2000.w))),
      child: Consumer<SharedDataProvider>(
          builder: (_, provider, __) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
              return Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(height: 125.h),
                SizedBox(
                  width: 1012.w,
                  child: Column(
                    children: moreButton.map((e) {
                      return GestureDetector(
                        onTap:(){
                          if(e.id==0){
                            widget.isFavorite=!widget.isFavorite;
                            setState((){});
                          }
                          e.onTap!(context);
                          },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/${e.image}",
                                  height: 96.w,
                                  width: 96.w,
                                ),
                                Text(
                                  e.title?.tr ?? '',
                                  style: TextStyle(
                                      fontSize: 40.sp,
                                      fontWeight: FontWeight.w500,
                                      color: ThemeClass.primaryColor),
                                )
                              ],
                            ),
                            Divider(
                              color: ThemeClass.secondDarkGray,
                              thickness: 1.h,
                              height: 60.h,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 15.h,),
                SizedBox(
                    width: 1012.w,
                    child: Column(children: [
                      Row(
                        children: [
                          SizedBox(width: 30.w),
                          SizedBox(
                            width: 250.w,
                            child: Text(
                              "font_size".tr,
                              style: TextStyle(
                                  fontSize: 40.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ThemeClass.primaryColor),
                            ),
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(end: 35.w),
                            height: 50.h,
                            width: 2.w,
                            color: ThemeClass.secondDarkGray,
                          ),
                          Row(
                            children: setFontSize.map((e) {
                              return  GestureDetector(
                                onTap: (){
                                  if(e.id==0){
                                    provider.increaseFontSize();
                                  }else if(e.id==1){
                                    provider.setDefaultFontSize();
                                  }else{
                                    provider.decreaseFontSize();
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsetsDirectional.only(end: 24.w),
                                  width: 162.w,
                                  height: 62.h,
                                  decoration: BoxDecoration(
                                    color: e.color,
                                    borderRadius: BorderRadius.circular(8.w,),
                                    border: Border.all(color: ThemeClass.primaryColor,width: 1.w),
                                  ),
                                  child: Icon(e.icon,size: 50.w,color: e.id==1?Colors.white:ThemeClass.primaryColor,),
                                ),
                              );
                            }).toList(),

                          )
                        ],
                      ),
                      SizedBox(height: 15.h,),
                      Divider(color: ThemeClass.secondDarkGray, thickness: 1.h),
                      SizedBox(height: 15.h,),
                      Row(
                        children: [
                          SizedBox(width: 30.w),
                          SizedBox(
                            width: 250.w,
                            child: Text(
                              "font_color".tr,
                              style: TextStyle(
                                  fontSize: 40.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ThemeClass.primaryColor),
                            ),
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(end: 35.w),
                            height: 50.h,
                            width: 2.w,
                            color: ThemeClass.secondDarkGray,
                          ),
                          Flexible(
                              child: Row(
                            children: fontColor.map((e) {
                              return InkWell(
                                onTap: (){
                                  if(e.color!=null){
                                    provider.setFontColor(newFontColor: e.color!);
                                  }
                                  selectFontColor=e.id??0;
                                  setState((){});
                                },
                                child: Container(
                                  width: 75.w,
                                  alignment: Alignment.center,
                                  height: 75.w,
                                  margin: EdgeInsetsDirectional.only(end: 50.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: ThemeClass.darkGray,width: 1.w),
                                      shape: BoxShape.circle, color: e.color),
                                  child:selectFontColor==e.id?  const Icon(Icons.check,color:Colors.white,):const SizedBox(),
                                ),
                              );
                            }).toList(),
                          )),
                        ],
                      ),
                      SizedBox(height: 15.h,),
                      Divider(color: ThemeClass.secondDarkGray, thickness: 1.h),
                      SizedBox(height: 15.h,),
                      Row(
                          children: [
                        SizedBox(width: 30.w),
                        SizedBox(
                          width: 250.w,
                          child: Text(
                            "backGround_color".tr,
                            style: TextStyle(
                                fontSize: 40.sp,
                                fontWeight: FontWeight.w500,
                                color: ThemeClass.primaryColor),
                          ),
                        ),
                        Container(
                          margin: EdgeInsetsDirectional.only(end: 35.w),
                          height: 50.h,
                          width: 2.w,
                          color: ThemeClass.secondDarkGray,
                        ),
                        Flexible(
                            child: Row(
                          children: backGroundColor.map((e) {
                            return InkWell(
                              onTap: (){
                                if(e.color!=null){
                                  provider.setBackGroundColor(newBackGroundColor: e.color!);
                                }
                                selectBackGroundColor=e.id??0;
                                setState((){});
                              },
                              child: Container(
                                width: 75.w,
                                alignment: Alignment.center,
                                height: 75.w,
                                margin: EdgeInsetsDirectional.only(end: 50.w),
                                decoration: BoxDecoration(
                                  border: Border.all(color: ThemeClass.darkGray,width: 1.w),
                                    shape: BoxShape.circle, color: e.color),
                                child:selectBackGroundColor==e.id?  Icon(Icons.check,color:ThemeClass.primaryColor,):const SizedBox(),
                              ),
                            );
                          }).toList()))])])),
                SizedBox(height: 105.h)
              ]);
            }
          );
        }
      ),
    );
  }
}

class MoreModel {
  final int? id;
  final String? title;
  final String? image;
  final Function? onTap;
  final Color? color;
  final IconData? icon;

  MoreModel({this.color, this.id, this.title, this.image, this.onTap,this.icon});
}
