import 'package:dwawin/Models/poem_model.dart';
import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import '../../../Control/shared_data_provider.dart';
import '../Controller/pomes_show_controller.dart';
import '../Widget/poems_show_header_widget.dart';

class PoemsShow extends StatefulWidget {
  static const routeName = "/PoemsShow";
final PoemModel poemModel;
  const PoemsShow({Key? key, required this.poemModel}) : super(key: key);

  @override
  State createState() => _PoemsShowState();
}

class _PoemsShowState extends StateMVC<PoemsShow> {
  _PoemsShowState() : super(PoemsShowController()) {
    con = PoemsShowController();
  }

  late PoemsShowController con;

  @override
  void initState() {
    con.poem=widget.poemModel;
    con.getPoem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SharedDataProvider>(
        builder: (_, provider, __) {
        return Scaffold(
            backgroundColor: provider.backGroundColor,
            body: Stack(children: [
              SvgPicture.asset(
                "assets/images/BG.svg",
                fit: BoxFit.cover,
              ),
            if(con.poem!=null)Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                      slivers: [
                        PoemsShowHeaderWidget(
                          poem: con.poem!,
                            searchController: con.searchController,
                          moreOnTap: ()=>con.moreOnTap(context: context),
                        ),
                        SliverToBoxAdapter(child:
                        Column(
                          children: con.poem!.content.map((e){
                            return Center(
                              child: SizedBox(
                                width: 1025.w,
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 30.h,),
                                  Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Text(e.verse1??'',style: TextStyle(
                                      fontSize: provider.fontSize.sp,
                                      color: provider.fontColor,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ),
                                  SizedBox(height: 30.h,),

                                  Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                        child: Text(e.verse2??'',style: TextStyle(
                                            fontSize: provider.fontSize.sp,
                                            color: provider.fontColor,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                      ),

                                  SizedBox(height: 30.h,),
                                ],
                              ),
                            ));

                          }).toList(),
                        ),),
                        SliverToBoxAdapter(child: SizedBox(height: 50.h,),)
                      ]

                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50.w,vertical: 40.h),
                  height: 425.h,
                  width: double.infinity,
                  color:const Color(0xff047E63),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "${"vocalist".tr} أبو عمار المصري",style: TextStyle(
                            fontSize: 40.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                          ),),

                          InkWell(
                            onTap: (){
                              print("lsmmdlmsd");
                            },
                            child: SvgPicture.asset(
                              "assets/images/ic_mnshed.svg",
                              fit: BoxFit.cover,
                              width: 96.w,
                              height: 96.h,
                            ),
                          ),

                        ],
                      ),

                     Directionality(
                       textDirection: TextDirection.rtl,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Icon(Icons.repeat,size: 95.w,color: Colors.white,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                             Icon(Icons.skip_next,size: 95.w,color: Colors.white,),
                             SizedBox(width: 32.w,),
                             Icon(Icons.skip_next,size: 95.w,color: Colors.white,),
                               SizedBox(width: 32.w,),
                             InkWell(
                               onTap: (){},
                                 child: Icon(Icons.play_circle_outline,size: 95.w,color: Colors.white,)),
                               SizedBox(width: 32.w,),
                             Icon(Icons.skip_previous_rounded,size: 95.w,color: Colors.white,),
                               SizedBox(width: 32.w,),
                             Icon(Icons.repeat,size: 95.w,color: Colors.white,),
                           ],),
                           Icon(Icons.file_download_outlined,size: 95.w,color: Colors.white,),
                         ],
                       ),
                     )

                    ],
                  ),
                ),
              ],
            ),
            ]));
      }
    );
  }
}
