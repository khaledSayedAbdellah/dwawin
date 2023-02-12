import 'package:dwawin/Modules/Note/Controller/note_conteroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Utilities/theme_helper.dart';
import '../Widget/note_header.dart';

class Note extends StatefulWidget {
  static const routeName = "/Note";

  const Note({Key? key}) : super(key: key);

  @override
  State createState() => _NoteState();
}

class _NoteState extends StateMVC<Note> {
  _NoteState():super(NoteController()){
    con=NoteController();
  }
  late NoteController con;
  @override
  void initState() {
    con.getData();
    super.initState();
  }
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
                  NoteHeaderWidget(searchController: con.searchController),                  // SliverList(
                  SliverToBoxAdapter(
                    child: Stack(
                      children: [0,1,2].map((e) {
                        return Center(
                          child: Container(
                            height: 1530.h,
                            margin: EdgeInsetsDirectional.only(top: e*40.h),
                            padding: EdgeInsets.all(30.w,),
                            width: con.stackWidth[e].toDouble().w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.w),
                              border: Border.all(width:e==0? 1.w:e*2.w,color: ThemeClass.primaryColor)
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children:con.poemsNote.map((e) {
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/images/ic_add_comment.svg",
                                            fit: BoxFit.cover,
                                            width: 100.w,
                                            height: 100.h,
                                          ),
                                          SizedBox(width: 20.w,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 20.h,),
                                              Text(e.name??'',style: TextStyle(
                                                fontSize: 34.sp,
                                                fontWeight: FontWeight.w500,
                                                color: ThemeClass.secondDarkGray
                                              ),),
                                              SizedBox(height: 20.h,),
                                              Text(e.notes??'',style: TextStyle(
                                                fontSize: 30.sp,
                                                fontWeight: FontWeight.w500,
                                                color: ThemeClass.secondDarkGray
                                              ),),
                                            ],
                                          )
                                        ],
                                      ),
                                      Divider(height: 32.h,),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),

                          ),
                        );
                      }).toList(),
                    ),
                  )
                ]),
          ],
        ));
  }
}
