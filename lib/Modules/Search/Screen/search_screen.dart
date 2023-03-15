import 'dart:developer';

import 'package:dwawin/Models/poem_model.dart';
import 'package:dwawin/Models/verse_model.dart';
import 'package:dwawin/Utilities/LayoutHelper/loading_screen.dart';
import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Utilities/theme_helper.dart';
import '../../PomesShow/Screen/poems_show.dart';
import '../Controler/search_controller.dart';
import '../Widget/search_header_widget.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = "/SearchScreen";
  final String searchText;
  final int? id;
  final bool? isDiwan;

  const SearchScreen({Key? key, required this.searchText, this.id, this.isDiwan}) : super(key: key);

  @override
  State createState() => _SearchScreenState();
}

class _SearchScreenState extends StateMVC<SearchScreen> {
  _SearchScreenState() : super(SearchScreenController()) {
    con = SearchScreenController();
  }

  late SearchScreenController con;

  @override
  void initState() {
    con.id=widget.id;
    con.isDiwan=widget.isDiwan;
    con.searchController = TextEditingController(text: widget.searchText);
    con.getData();
    con.searchController.addListener(con.getData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      loading: con.loading,
      child: Scaffold(
          backgroundColor: ThemeClass.backGround,
          body: Stack(children: [
            SvgPicture.asset(
              "assets/images/BG.svg",
              fit: BoxFit.cover),
            CustomScrollView(slivers: [
              SearchHeaderWidget(
                searchController: con.searchController,
                numOfResult: con.searchList.length),
              SliverToBoxAdapter(
                  child: Center(
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 28.h),
                          width: 1025.w,
                          child: Row(children: [
                            SvgPicture.asset(
                              "assets/images/book.svg",
                              height: 90.w,
                              width: 90.w),
                            Text(
                              "the_results".tr,
                              style: TextStyle(
                                  fontSize: 40.sp,
                                  color: ThemeClass.secondaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 20.w),
                            Expanded(
                                child: Divider(
                                    height: 1.h,
                                    color: ThemeClass.secondaryColor))
                          ])))),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                          Navigator.of(context).pushNamed(PoemsShow.routeName,arguments:PoemModel(id: con.searchList[index].poemId));
                      },
                        child: ContentWidget(verseModel: con.searchList[index],));
                  },
                  childCount: con.searchList.length,
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 50.h))])])
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  final VerseModel verseModel;
  const ContentWidget({Key? key, required this.verseModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 1025.w,
        margin: EdgeInsetsDirectional.only(bottom: 25.h),
        padding: EdgeInsetsDirectional.only(
            top: 40.h, bottom: 30.h, start: 30.w, end: 30.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.w),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                children: [
                  SizedBox(width: 90.w),
                  Text(
                      verseModel.verse1??"",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30.sp,
                          color: ThemeClass.darkGray)),
                  SizedBox(width: 50.w),
                  Text(
                      verseModel.verse2??"",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30.sp,
                          color: ThemeClass.darkGray),
                  ),
                ],
              ),
            SizedBox(height: 36.h),
            Row(
              children: [
                SvgPicture.asset(
                    "assets/images/book.svg",
                    height: 90.w),
                SizedBox(width: 10.w),

                Text(
                  "${verseModel.poemName!=null?"poems".tr:(verseModel.isCollection == 0?"diwan".tr:"knash".tr)}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32.sp,
                      color: ThemeClass.primaryColor),
                ),
                SizedBox(width: 10.w,),
                Text(
                  verseModel.poemName??verseModel.diwanName??"",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: ThemeClass.primaryColor,
                      fontSize: 32.sp),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
