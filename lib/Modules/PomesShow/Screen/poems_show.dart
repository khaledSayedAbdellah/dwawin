import 'dart:developer';

import 'package:dwawin/Models/media_model.dart';
import 'package:dwawin/Models/poem_model.dart';
import 'package:dwawin/Utilities/LayoutHelper/background_widget.dart';
import 'package:dwawin/Utilities/LayoutHelper/loading_screen.dart';
import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import '../../../Control/shared_data_provider.dart';
import '../Widget/seek_bar_widget.dart';
import '../Controller/pomes_show_controller.dart';
import '../Widget/control_buttons_widget.dart';
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
    con.poem = widget.poemModel;
    con.selectedShareVersesIds = [];
    con.getPoem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      loading: con.loading,
      child: Consumer<SharedDataProvider>(builder: (_, provider, __) {
        return BackGroundWidget(
          color: provider.backGroundColor,
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  Expanded(
                    child: CustomScrollView(slivers: [
                      PoemsShowHeaderWidget(
                        poem: con.poem!,
                        searchController: con.searchController,
                        moreOnTap: () => con.moreOnTap(context: context),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          children: con.poem!.content.map((e) {
                            return GestureDetector(
                              onTap: (){
                                log(e.id.toString());
                                if(con.selectedShareVersesIds.contains(e.id)){
                                  con.selectedShareVersesIds.remove(e.id);
                                } else{
                                  if(e.id!=null) con.selectedShareVersesIds.add(e.id!);
                                }
                                setState(() { });
                              },
                              child: Center(
                                  child: Container(
                                    color: con.selectedShareVersesIds.contains(e.id)?Colors.grey.withOpacity(0.4):Colors.transparent,
                                    width: 1025.w,
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional.centerStart,
                                          child: Text(
                                            e.verse1 ?? '',
                                            style: TextStyle(
                                              fontSize: provider.fontSize.sp,
                                              color: provider.fontColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional.centerEnd,
                                          child: Text(
                                            e.verse2 ?? '',
                                            style: TextStyle(
                                              fontSize: provider.fontSize.sp,
                                              color: provider.fontColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                      ],
                                    ),
                                  )),
                            );
                          }).toList(),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 50.h,
                        ),
                      )
                    ]),
                  ),
                  if(con.media.isNotEmpty) Container(
                    padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 40.h),
                    height: 600.h,
                    width: double.infinity,
                    color: const Color(0xff047E63),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${"vocalist".tr} ${con.selectedMedia?.name??""}",
                              style: TextStyle(
                                  fontSize: 40.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            GestureDetector(
                              onTap: ()=> con.onPickSound(context),
                              child: SvgPicture.asset(
                                "assets/images/ic_mnshed.svg",
                                fit: BoxFit.cover,
                                width: 96.w,
                                height: 96.h,
                              ),
                            ),
                          ],
                        ),
                        StreamBuilder<PositionData>(
                          stream: con.positionDataStream,
                          builder: (context, snapshot) {
                            final positionData = snapshot.data;
                            return SeekBarWidget(
                              duration: positionData?.duration ?? Duration.zero,
                              position: positionData?.position ?? Duration.zero,
                              bufferedPosition: positionData?.bufferedPosition ?? Duration.zero,
                              onChangeEnd: (newPosition) {
                                print(newPosition);
                                con.player.seek(newPosition);
                              },
                            );
                          },
                        ),
                        ControlButtons(
                          player: con.player,
                          canPlay: con.selectedMedia!=null,
                          isDownloaded: (con.selectedMedia?.file!=null || con.selectedMedia==null),
                          downloadOnTap: con.download,
                        )
                      ],
                    ),
                  ),
                ],
              ),
          ),
        );
      }),
    );
  }
}


