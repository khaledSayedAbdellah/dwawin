import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Utilities/theme_helper.dart';
import '../../../../Widgets/custome_text_filed.dart';
import '../../../Search/Screen/search_screen.dart';
class PoemsHeaderWidget extends StatelessWidget {
  final TextEditingController searchController;
  const PoemsHeaderWidget({Key? key, required this.searchController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      snap: true,
      floating: true,
      expandedHeight: 540.h,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace:  FlexibleSpaceBar(
        background: Stack(
          children: [
            Container(
              height: 450.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ThemeClass.primaryColor,
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/orn-header-home.png")
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80.w), bottomRight: Radius.circular(80.w)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 60.w,),
                      SvgPicture.asset(
                        "assets/images/ic_ksaed2.svg",
                        height: 100.w,
                        width: 100.w,
                        color: Colors.white,
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Poems".tr,style: TextStyle(
                              fontSize: 38.sp,
                              fontWeight:FontWeight.bold ,color: Colors.white
                          ),),
                          SizedBox(height:40.h ,),
                          Text("all_poems".tr,style: TextStyle(
                              fontSize: 38.sp,
                              fontWeight:FontWeight.bold ,color: Colors.white
                          ),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 60.h,)
                ],
              ),
            ),
            Positioned(
              bottom:30.h,
              left: 0,
              right: 0,
              child: Center(
                child: CustomTextFieldWidget(
                  onSave: (v)=>Navigator.of(context).pushNamed(SearchScreen.routeName,arguments: [v,null,null]),
                  controller: searchController,
                  prefixIcon: Icon(Icons.search_sharp,color: ThemeClass.darkGray,),
                  backGroundColor: Colors.white,
                  borderColor: Colors.white,
                  borderRadiusValue: 25.w,
                  hint:"search".tr,
                  activeBorderColor:Colors.white,
                  hintStyle: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    color: ThemeClass.darkGray,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
