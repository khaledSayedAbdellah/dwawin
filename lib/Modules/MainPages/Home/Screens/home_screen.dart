import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../../Utilities/LayoutHelper/background_widget.dart';
import '../../../../Utilities/theme_helper.dart';
import '../../../Search/Screen/search_screen.dart';
import '../../Drawer/Screen/drawer.dart';
import '../Widgets/audible_poems_widget.dart';
import '../Widgets/eldawawin_show_all_widget.dart';
import '../Widgets/header_widget.dart';
import '../../../../Widgets/poems_widget.dart';
import '../Widgets/home_poems_show_all_widget.dart';
import '../../../../Widgets/eldiwan_widget.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends StateMVC<HomeScreen> {
  _HomeScreenState() : super(HomeController()) {
    con = HomeController();
  }

  late HomeController con;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BackGroundWidget(
        child: Scaffold(
          drawer:const DrawerScreen(),
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              HeaderWidget(searchController: con.searchController),
              const AudiblePoemsWidget(),
              const EldawawinShowAll(),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return EldiwanWidget(eldawawin:con.eldawainList.take(4).toList()[index] ,);
                  },
                  childCount: con.eldawainList.take(4).length,
                ),
              ),
              const PoemsShowAllWidget(),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return PoemsWidget(poem:con.poemsList[index] ,);
                  },
                  childCount: con.poemsList.take(4).length,
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 250.h,),),
            ],
          ),
        ),
      ),
    );
  }
}
