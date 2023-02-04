import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Utilities/theme_helper.dart';
import '../Controler/search_controller.dart';
import '../Widget/search_header_widget.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = "/SearchScreen";
  final String searchText;

  const SearchScreen({Key? key, required this.searchText}) : super(key: key);

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
    con.searchController = TextEditingController(text: widget.searchText);
    con.searchController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeClass.backGround,
        body: Stack(children: [
          SvgPicture.asset(
            "assets/images/BG.svg",
            fit: BoxFit.cover),
          CustomScrollView(slivers: [
            SearchHeaderWidget(
              searchController: con.searchController,
              numOfResult: 9),
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
                          if (index.isEven)
                            Row(
                              children: [
                                SizedBox(width: 90.w),
                                Text(
                                  "يلي أن هذه أرض طه محمد",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30.sp,
                                      color: ThemeClass.darkGray)),
                                SizedBox(width: 50.w),
                                Text(
                                  "يلي أن هذه أرض طه محمد",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30.sp,
                                      color: ThemeClass.darkGray)),
                              ],
                            ),
                          if (index.isOdd)
                            Row(
                              children: [
                                SizedBox(width: 90.w),
                                Text(
                                  "يلي أن هذه أرض طه محمد",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30.sp,
                                      color: ThemeClass.darkGray)),
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
                                "diwan".tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32.sp,
                                    color: ThemeClass.primaryColor),
                              ),
                              Text(
                                " ديوان جبر الكسر",
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
                },
                childCount: 6,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 50.h))])])
    );
  }
}
