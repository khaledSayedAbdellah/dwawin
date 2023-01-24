import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Control/shared_data_provider.dart';
import '../../../Utilities/theme_helper.dart';
import '../../../Widgets/nav_bar_widget.dart';
import '../../Favorites/Widget/favorites_header_widget.dart';
import '../Controller/diwan_show_conteoller.dart';
import '../Widget/about_diwan_widget.dart';
import '../Widget/diwan_show_list_design.dart';
import '../Widget/elquafy_widget.dart';

class DiwanShow extends StatefulWidget {
  static const routeName = "/DiwanShow";

  const DiwanShow({Key? key}) : super(key: key);

  @override
  State createState() => _DiwanShowState();
}

class _DiwanShowState extends StateMVC<DiwanShow> {
  _DiwanShowState() : super(DiwanShowController()) {
    con = DiwanShowController();
  }

  late DiwanShowController con;

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
            const AboutDiwan(aboutDiwan: "ديوان سير القلب بمدح المصطفى الحب إلى حضرة الرب إنه ديوان يسموا بالمتأمل فيه إلى مجالات يكل اللسان عن التعبير عنها، كما أنه يصف كل ما كان يعانيه العصر من مشاكل ودعوات وصراع، فهو أذن ديوان يستحق الأعتناء به لكل محب ولكل أديب ولكل سائر إلى حضرة الرب"),
             ElquafyWidget(elquafi: con.elquafi),
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
                  return DiwanShowDesignList(eldawawin:con.poemsList[index] ,);
                },
                childCount:con.poemsList.length,
              ),
            ),
          ])
        ]),
//       bottomNavigationBar: NavBarWidget(
// onChange: (i){},
//         selectedIndex: context.read<SharedDataProvider>().currentNavIndex,),
    );
  }
}
