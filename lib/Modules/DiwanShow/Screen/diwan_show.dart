import 'package:dwawin/Models/diwan_model.dart';
import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Utilities/theme_helper.dart';
import '../../Favorites/Widget/favorites_header_widget.dart';
import '../Controller/diwan_show_conteoller.dart';
import '../Widget/about_diwan_widget.dart';
import '../Widget/diwan_show_list_design.dart';
import '../Widget/elquafy_widget.dart';

class DiwanShow extends StatefulWidget {
  static const routeName = "/DiwanShow";
final DiwanModel? diwan;
  const DiwanShow({Key? key, this.diwan}) : super(key: key);

  @override
  State createState() => _DiwanShowState();
}

class _DiwanShowState extends StateMVC<DiwanShow> {
  _DiwanShowState() : super(DiwanShowController()) {
    con = DiwanShowController();
  }

  late DiwanShowController con;
@override
  void initState() {
    con.diwanId=widget.diwan?.id??0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeClass.backGround,
        body: Stack(children: [
          SvgPicture.asset(
            "assets/images/BG.svg",
            fit: BoxFit.cover,
          ),
          CustomScrollView(slivers: [
            FavoritesHeaderWidget(searchController: con.searchController),
             AboutDiwan(aboutDiwan: widget.diwan?.description??''),
             ElquafyWidget(elquafi: con.getRhymeByDiwanId),
            SliverToBoxAdapter(
              child:Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 28.h),
                  width: 1025.w,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/book.svg",
                        height: 90.w,
                        width: 90.w,
                      ),
                      Text("Poems".tr,style: TextStyle(
                          fontSize: 40.sp,
                          color: ThemeClass.secondaryColor,
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(width: 20.w,),
                      Expanded(child: Divider(height: 1.h,color: ThemeClass.secondaryColor,))
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return DiwanPoemWidget(poem:con.getPoemsByDiwanId[index] ,);
                },
                childCount:con.getPoemsByDiwanId.length,
              ),
            )

          ])
        ]),
//       bottomNavigationBar: NavBarWidget(
// onChange: (i){},
//         selectedIndex: context.read<SharedDataProvider>().currentNavIndex,),
    );
  }
}