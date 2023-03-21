import 'dart:io';
import 'package:dwawin/Models/poem_model.dart';
import 'package:dwawin/Utilities/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';


class ShareHelper {

  final PoemModel poemModel;
  final BuildContext context;
  ShareHelper({required this.context,required this.poemModel});

  Future _shareAsText()async{
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(poemModel.content.map((e) => "${e.verse1} ... ${e.verse2} \n").join(),
        subject: poemModel.name??"",
    sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
  Future _shareAsImage()async{
    final box = context.findRenderObject() as RenderBox?;

    File imageFile = File("");
    Share.shareXFiles([XFile(imageFile.path)], subject: poemModel.name??"",
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,);
  }

  Future onShare()async{
    await showDialog(
      context: context,
      builder: (_){
        return _ShareDialogWidget(
          onShareAsText: _shareAsText,
          onShareAsImage: _shareAsImage,
          poemContent: poemModel.content.map((e) => "${e.verse1} ... ${e.verse2} \n").join(),
        );
      }
    );
  }

}

class _ShareDialogWidget extends StatefulWidget {
  final Function() onShareAsText,onShareAsImage;
  final String poemContent;
  const _ShareDialogWidget({Key? key, required this.onShareAsText, required this.onShareAsImage, required this.poemContent}) : super(key: key);

  @override
  State<_ShareDialogWidget> createState() => _ShareDialogWidgetState();
}

class _ShareDialogWidgetState extends State<_ShareDialogWidget> {

  bool shareAsText = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 1070.w,
        height: 1300.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          color: Colors.white
        ),
        padding: EdgeInsets.symmetric(horizontal: 50.w,vertical: 50.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: ()=> setState(() {shareAsText = true;}),
                  child: Container(
                    width: 450.w,
                    height: 125.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: !shareAsText?Colors.white:ThemeClass.primaryColor,
                        border: Border.all(color: shareAsText?Colors.white:ThemeClass.primaryColor,)
                    ),
                    alignment: Alignment.center,
                    child: Text("مشاركه كنص",style: TextStyle(color: shareAsText?Colors.white:ThemeClass.primaryColor,fontSize: 44.sp),),
                  ),
                ),
                GestureDetector(
                  onTap: ()=> setState(() {shareAsText = false;}),
                  child: Container(
                    width: 450.w,
                    height: 125.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: shareAsText?Colors.white:ThemeClass.primaryColor,
                      border: Border.all(color: !shareAsText?Colors.white:ThemeClass.primaryColor,)
                    ),
                    alignment: Alignment.center,
                    child: Text("مشاركه كصوره",style: TextStyle(color: !shareAsText?Colors.white:ThemeClass.primaryColor,fontSize: 44.sp),),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h,),
            Expanded(
              flex: 6,
              child: Center(
                child: Text(
                    widget.poemContent, style: TextStyle(color: Colors.black,fontSize: 35.sp,height: 2),
                    maxLines: 8,overflow: TextOverflow.ellipsis),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: shareAsText?widget.onShareAsText:widget.onShareAsImage,
              child: Container(
                height: 150.h,
                width: 925.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: ThemeClass.primaryColor,
                ),
                alignment: Alignment.center,
                child: Text("مشاركة",style: TextStyle(color: Colors.white,fontSize: 55.sp),),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}


