import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Utilities/theme_helper.dart';
import '../../PomesShow/Screen/poems_show.dart';
import '../Controller/favorites_controller.dart';
import '../Widget/favorites_header_widget.dart';
import '../../../Utilities/helper.dart';

class Favorites extends StatefulWidget {
  static const routeName = "/Favorites";

  const Favorites({Key? key}) : super(key: key);

  @override
  State createState() => _FavoritesState();
}

class _FavoritesState extends StateMVC<Favorites> {
  _FavoritesState():super(FavoritesController()){
    con=FavoritesController();
  }
  late FavoritesController con;
  @override
  void initState() {
    con.getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeClass.backGround,
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
                  FavoritesHeaderWidget(searchController: con.searchController),                  // SliverList(
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
                                children:con.favoritePoems.map((e) {
                                  return Column(
                                    children: [
                                      GestureDetector(
                                        onTap: ()=>Navigator.of(context).pushNamed(PoemsShow.routeName,arguments: e),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/images/book.svg",
                                              fit: BoxFit.cover,
                                              width: 96.w,
                                              height: 96.h,
                                            ),
                                            SizedBox(width: 20.w,),
                                            Expanded(
                                              child: Text(e.name??'',style: TextStyle(
                                                  fontSize: 34.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: ThemeClass.secondDarkGray
                                              ),),
                                            ),

                                            PopupMenuButton<int>(
                                              onSelected: (i){
                                                if(i == 1) con.onDelete(e);
                                              },
                                              itemBuilder: (context) => [
                                                PopupMenuItem(
                                                  value: 1,
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.delete),
                                                      SizedBox(width: 10.w,),
                                                      Text("delete".tr),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                              offset: Offset(100.w, 60.h),
                                            ),
                                          ],
                                        ),
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
