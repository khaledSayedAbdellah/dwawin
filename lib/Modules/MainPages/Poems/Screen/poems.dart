import 'dart:io';
import 'package:dwawin/Modules/MainPages/Poems/Controller/poems_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../../Utilities/theme_helper.dart';
import '../../../../Widgets/poems_widget.dart';
import '../Widget/poems_header_widget.dart';

class PoemsScreen extends StatefulWidget {
  const PoemsScreen({Key? key}) : super(key: key);

  @override
  State createState() => _PoemsScreenState();
}

class _PoemsScreenState extends StateMVC<PoemsScreen> {
  _PoemsScreenState(): super(PoemsController()){
    con =  PoemsController();
  }
  late PoemsController con;



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
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
                    PoemsHeaderWidget(searchController: con.searchController,),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return PoemsWidget(poem:con.poemsList[index] ,);
                        },
                        childCount: con.poemsList.length,
                      ),
                    ),
                  ]),

            ]),
      ),
    );
  }
}



