import 'package:dwawin/Modules/Search/Screen/search_screen.dart';
import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Utilities/theme_helper.dart';
import '../../../../Widgets/custome_text_filed.dart';
class HeaderWidget extends StatelessWidget {
  final TextEditingController searchController;
  const HeaderWidget({Key? key, required this.searchController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      snap: true,
      floating: true,
      expandedHeight: 700.h,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace:  FlexibleSpaceBar(
        background: Stack(
          children: [
            Container(
              height: 556.h,
              width: double.infinity,
              alignment: Alignment.bottomCenter,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    "assets/images/homehedar.svg",
                    height: 450.h,
                    fit: BoxFit.cover,
                    // height: double.infinity,
                  ),
                  // SizedBox(height: 20.h,)
                ],
              ),
            ),
            Positioned(
              bottom: 85.h,
              left: 0,
              right: 0,
              child: Center(
                child: CustomTextFieldWidget(
                  textInputType: TextInputType.text,
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
