import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Utilities/theme_helper.dart';
import '../../../../Widgets/custome_text_filed.dart';
import '../../../Models/diwan_model.dart';
import '../../Search/Screen/search_screen.dart';
class EldiwanHeaderWidget extends StatelessWidget {
  final TextEditingController searchController;
  final DiwanModel? diwan;

  const EldiwanHeaderWidget({Key? key, required this.searchController, this.diwan}) : super(key: key);

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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButton(color: Colors.white),
                  Center(
                    child: SizedBox(
                      width: 1025.w,
                      child: Text(diwan?.name??'',style: TextStyle(
                          fontSize: 38.sp,
                          fontWeight:FontWeight.bold ,color: Colors.white
                      ),),
                    ),
                  ),
                  SizedBox(height: 41.h,),
                  Center(
                    child: SizedBox(
                      width: 1025.w,
                      child: Text("${"num_of_poem".tr} ${diwan?.nOfPoems.toString()} ${"poems".tr}",style: TextStyle(
                          fontSize: 38.sp,
                          fontWeight:FontWeight.bold ,color: Colors.white
                      ),),
                    ),
                  ),
                  SizedBox(height: 48.h,),
                ],
              ),
            ),
            Positioned(
              bottom:30.h,
              left: 0,
              right: 0,
              child: Center(
                child: CustomTextFieldWidget(
                  onSave: (v)=>Navigator.of(context).pushNamed(SearchScreen.routeName,arguments: [v,diwan?.id??0,true]),
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
