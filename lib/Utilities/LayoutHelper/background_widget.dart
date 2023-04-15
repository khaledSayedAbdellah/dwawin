

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackGroundWidget extends StatelessWidget {
  final Widget child;
  final Color? color;
  const BackGroundWidget({Key? key, required this.child, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 1125.w,
          height: 2436.h,
          color: color??Color(0xffffFCEE),
          child: Image.asset(
            "assets/images/BG.png",
            height: 1125.w,
            width: 2436.h,
            fit: BoxFit.fill,
          ),
        ),
        child,
      ],
    );
  }
}
