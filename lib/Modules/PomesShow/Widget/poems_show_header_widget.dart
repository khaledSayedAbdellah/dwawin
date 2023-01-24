import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utilities/theme_helper.dart';
import '../../../Widgets/custome_text_filed.dart';
class PoemsShowHeaderWidget extends StatelessWidget {
  final TextEditingController searchController;
  final Function() moreOnTap;
  const PoemsShowHeaderWidget({Key? key, required this.searchController, required this.moreOnTap}) : super(key: key);

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
              child: Center(
                child: SizedBox(
                  width: 1025.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("أطيف سرى أم أن ركبي يقفا",style: TextStyle(
                              fontSize: 38.sp,
                              fontWeight:FontWeight.bold ,color: Colors.white
                          ),),
                          SizedBox(height: 41.h,),
                          Row(
                            children: [
                              Text("${"number_verses".tr}45 بيت ",style: TextStyle(
                                  fontSize: 38.sp,
                                  fontWeight:FontWeight.bold ,color: Colors.white
                              ),),
                              SizedBox(width: 73.w,),
                              Text(
                                "${"alqafia".tr}حرف الألف",style: TextStyle(
                                  fontSize: 38.sp,
                                  fontWeight:FontWeight.bold ,color: Colors.white
                              ),),
                            ],
                          ),
                          SizedBox(height: 48.h,),
                        ],
                      ),
                      IconButton(onPressed:moreOnTap, icon: Icon(Icons.more_horiz,size: 96.w,color: Colors.white,))
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom:30.h,
              left: 0,
              right: 0,
              child: Center(
                child: CustomTextFieldWidget(
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
