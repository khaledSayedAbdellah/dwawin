import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utilities/initial_local_data.dart';
import '../../Utilities/theme_helper.dart';
import 'main_screens.dart';

class SplashScreen extends StatefulWidget {
  static const routeName="/";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigator();
    super.initState();
  }
  navigator()async{
    await Future.delayed(const Duration(seconds: 2));
    await InitialLocalData.init();
    Navigator.of(context).pushNamed(MainScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
            alignment: Alignment.center,
            height: double.infinity,
            width:double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ThemeClass.primaryColor,
                    ThemeClass.secondaryColor,
                  ],
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 380.h,),
                SvgPicture.asset(
                  "assets/images/orn-splash.svg",
                  height: 1063.h,

                ),
                Text("splash_title".tr,style: TextStyle(
                  fontSize:60.sp ,
                  fontWeight:FontWeight.w500 ,
                  color: Color(0xff08EEF6)
                ),),
                Text("splash_dec".tr,style: TextStyle(
                  fontSize:60.sp ,
                  fontWeight:FontWeight.w500 ,
                  color: Colors.white
                ),),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      "assets/images/books-splash.svg",
                      height: 725.h,
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}