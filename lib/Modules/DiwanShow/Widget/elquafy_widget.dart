import 'package:dwawin/Models/poem_model.dart';
import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Utilities/theme_helper.dart';
import '../../PomesShow/Screen/poems_show.dart';
class ElquafyWidget extends StatelessWidget {
  final List<String> poemsRhyme;
  final Function(String) onSelect;
  const ElquafyWidget({Key? key, required this.poemsRhyme, required this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: SizedBox(
          width: 1025.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/ic_2squaer.svg",
                    height: 150.w,
                    width: 150.w,
                  ),
                  Text("Rhymes".tr,style: TextStyle(
                      fontSize: 40.sp,
                      color: ThemeClass.secondaryColor,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(width: 20.w,),
                  Expanded(child: Divider(height: 1.h,color: ThemeClass.secondaryColor,thickness: 2.h,))
                ],
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Wrap(
                  spacing: 10.w,
                  runSpacing: 10.h,
                  children: poemsRhyme.map((e){
                    return GestureDetector(
                      onTap: ()=> onSelect(e),
                      child: Container(
                        alignment: Alignment.center,
                        width: 155.w,
                        height: 80.h,
                        decoration:  BoxDecoration(
                            borderRadius:BorderRadius.circular(20.w),
                            color: const Color(0xffE9E9E9)
                        ),
                        child: Text(e??"",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ThemeClass.primaryColor,
                        ),),
                      ),
                    );
                  }).toList(),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
