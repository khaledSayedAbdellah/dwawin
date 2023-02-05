import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../../Utilities/theme_helper.dart';
import '../../../Search/Screen/search_scree.dart';
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
      child: Scaffold(
        drawer:const DrawerScreen(),
        backgroundColor: ThemeClass.backGround,
        body: Stack(
          children: [
            SvgPicture.asset(
              "assets/images/BG.svg",
              fit: BoxFit.cover,
            ),
            CustomScrollView(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
