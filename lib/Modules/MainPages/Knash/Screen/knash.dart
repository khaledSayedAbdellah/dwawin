import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../../Utilities/theme_helper.dart';
import '../../../../Widgets/eldiwan_widget.dart';
import '../Controller/knash_controller.dart';
import '../Widget/poems_header_widget.dart';

class KnashScreen extends StatefulWidget {
  const KnashScreen({Key? key}) : super(key: key);

  @override
  State createState() => _KnashScreenState();
}

class _KnashScreenState extends StateMVC<KnashScreen> {
  _KnashScreenState(): super(KnashController()){
    con =  KnashController();
  }
  late KnashController con;



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return false;
        if (Platform.isAndroid) SystemNavigator.pop();
        exit(0);
      },
      child: Scaffold(
        backgroundColor: ThemeClass.backGround,
        body: Stack(
            children: [
              SvgPicture.asset(
                "assets/images/BG.svg",
                fit: BoxFit.cover,
                // height: double.infinity,
              ),
              CustomScrollView(
                  slivers: [
                    PoemsHeaderWidget(searchController: con.searchController),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return EldiwanWidget(eldawawin:con.knashDwawin[index],);
                        },
                        childCount: con.knashDwawin.length,
                      ),
                    ),
                  ]),

            ]),
      ),
    );
  }
}



