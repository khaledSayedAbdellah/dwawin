import 'dart:io';
import 'package:dwawin/Modules/MainPages/Dawawin/Widget/eldawawin_header_widget.dart';
import 'package:dwawin/Utilities/LayoutHelper/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../../Utilities/theme_helper.dart';
import '../../../../Widgets/eldiwan_widget.dart';
import '../controller/dawawin_controller.dart';

class DawawinScreen extends StatefulWidget {
  const DawawinScreen({Key? key}) : super(key: key);

  @override
  State createState() => _DawawinScreenState();
}

class _DawawinScreenState extends StateMVC<DawawinScreen> {
  _DawawinScreenState(): super(DawawinController()){
    con =  DawawinController();
  }
  late DawawinController con;



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return false;
        if (Platform.isAndroid) SystemNavigator.pop();
        exit(0);
      },
      child: BackGroundWidget(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
              slivers: [
                EldawawinHeaderWidget(searchController: con.searchController,),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return EldiwanWidget(eldawawin:con.eldawainList[index],);
                    },
                    childCount: con.eldawainList.length,
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 250.h,),),
              ]),
        ),
      ),
    );
  }
}



