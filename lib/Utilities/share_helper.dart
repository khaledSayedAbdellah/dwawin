import 'dart:io';
import 'dart:typed_data';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dwawin/Models/poem_model.dart';
import 'package:dwawin/Utilities/LayoutHelper/loading_screen.dart';
import 'package:dwawin/Utilities/LayoutHelper/show_images.dart';
import 'package:dwawin/Utilities/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import 'helper.dart';


class ShareHelper {

  static List<String> backGroundImages = [
    "assets/PoemsImageShare/1.jpg",
    "assets/PoemsImageShare/2.jpg",
    "assets/PoemsImageShare/3.jpg",
    "assets/PoemsImageShare/4.jpg",
  ];

  final PoemModel poemModel;
  final BuildContext context;
  ShareHelper({required this.context,required this.poemModel});

  Future _shareAsText()async{
    final box = context.findRenderObject() as RenderBox?;
    String longContent = poemModel.content.map((e) => "${e.verse1}     ...     ${e.verse2}\n").join();
    String shortContent = poemModel.content.map((e) => "${e.verse1}\n                     ${e.verse2}\n").join();

    await Share.share(poemModel.content.length>15?longContent:shortContent,
        subject: poemModel.name??"",
    sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
  Future _shareAsImage(Uint8List data)async{
    final box = context.findRenderObject() as RenderBox?;
    final folderPath = await Helper.getMediaFolderPath(folderName: "shared");
    File imageFile = File("$folderPath/shardImage.png");
    imageFile.writeAsBytesSync(data);
    Share.shareXFiles([XFile(imageFile.path)], subject: poemModel.name??"",
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,);
  }

  Future _onShareImage(String image)async{
    String longContent = poemModel.content.map((e) => "${e.verse1}     ...     ${e.verse2}\n").join();
    String shortContent = poemModel.content.map((e) => "${e.verse1}\n                              ${e.verse2}\n").join();
    Modular.to.push(MaterialPageRoute(builder: (_)=> ConfirmSharedImage(
      image: image,
      poemContent: poemModel.content.length>15?longContent:shortContent,
      onConfirm: (result){
        if(result!=null) _shareAsImage(result);
      },
    )));
  }

  Future onShare()async{
    await showDialog(
      context: context,
      builder: (_){
        return _ShareDialogWidget(
          onShareAsText: _shareAsText,
          onShareAsImage: _onShareImage,
          poemContent: poemModel.content.map((e) => "${e.verse1}\n                         ${e.verse2}\n").join(),
        );
      }
    );
  }

}

class _ShareDialogWidget extends StatefulWidget {
  final Function() onShareAsText;
  final Function(String) onShareAsImage;
  final String poemContent;
  const _ShareDialogWidget({Key? key, required this.onShareAsText, required this.onShareAsImage, required this.poemContent}) : super(key: key);

  @override
  State<_ShareDialogWidget> createState() => _ShareDialogWidgetState();
}

class _ShareDialogWidgetState extends State<_ShareDialogWidget> {

  bool shareAsText = true;
  String selectedImage = ShareHelper.backGroundImages[0];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 1070.w,
        height: 1500.h,
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

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/images/book.svg",color: shareAsText?Colors.white:ThemeClass.primaryColor,
                        width: 100.w,height: 100.w,),
                        SizedBox(width: 10.w,),
                        Text("share_as_text".tr,style: TextStyle(color: shareAsText?Colors.white:ThemeClass.primaryColor,fontSize: 44.sp),),
                      ],
                    ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/images/img_icon.svg",color: !shareAsText?Colors.white:ThemeClass.primaryColor,
                        width: 85.w,height: 85.w,),
                        SizedBox(width: 10.w,),
                        Text("share_as_image".tr,style: TextStyle(
                            color: !shareAsText?Colors.white:ThemeClass.primaryColor,fontSize: 44.sp),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h,),
            if(!shareAsText) CarouselSlider(
                items: ShareHelper.backGroundImages.map((e){
                  return Center(
                    child: Stack(
                      children: [
                        Image.asset(e,fit: BoxFit.cover,width: 1000.w,height: 400.h,),
                        if(selectedImage != e)
                          Positioned.fill(
                            child: Container(
                              color: Colors.white.withOpacity(0.7),
                            ),
                          )
                      ],
                    ),
                  );
                }).toList(),
              options: CarouselOptions(
                aspectRatio: 2.5,
                viewportFraction: 0.55,
                enlargeFactor: 0.25,
                enlargeCenterPage: true,
                onPageChanged: (index,_)=> setState(() {selectedImage = ShareHelper.backGroundImages[index];}),
              ),
            ),
            Expanded(
              child: Center(
                child: AutoSizeText(
                    widget.poemContent, style: TextStyle(color: Colors.black),
                    maxLines: shareAsText?14:8,
                  minFontSize: shareAsText?18:14,
                  maxFontSize: 100,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            if(!shareAsText) Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("app_desc".tr,style: TextStyle(fontSize: 30.sp,color: Colors.grey,),),
                Image.asset("assets/images/logo_2.png",width: 120.w,height: 120.w,color: ThemeClass.primaryColor,),
                Text("app_2desc".tr,style: TextStyle(fontSize: 30.sp,color: Colors.grey,),),
              ],
            ),
            SizedBox(height: 20.h,),
            GestureDetector(
              onTap: shareAsText?widget.onShareAsText:()=> widget.onShareAsImage(selectedImage),
              child: Container(
                height: 150.h,
                width: 925.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: ThemeClass.primaryColor,
                ),
                alignment: Alignment.center,
                child: Text("share".tr,style: TextStyle(color: Colors.white,fontSize: 55.sp),),
              ),
            ),
            SizedBox(height: 20.h,),
          ],
        ),
      ),
    );
  }
}

class ConfirmSharedImage extends StatefulWidget {
  final Function(Uint8List?) onConfirm;
  final String poemContent,image;
  const ConfirmSharedImage({Key? key, required this.onConfirm, required this.poemContent, required this.image}) : super(key: key);

  @override
  State<ConfirmSharedImage> createState() => _ConfirmSharedImageState();
}

class _ConfirmSharedImageState extends State<ConfirmSharedImage> {
  final WidgetsToImageController controller = WidgetsToImageController();

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      loading: loading,
      child: Scaffold(
        body: WidgetsToImage(
          controller: controller,
          child: Container(
            child: Column(
              children: [
                Image.asset(widget.image,width: double.infinity,height: 750.h,fit: BoxFit.cover,),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: AutoSizeText(
                      widget.poemContent,
                      minFontSize: 5,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("app_desc".tr,style: TextStyle(fontSize: 30.sp,color: Colors.grey,),),
                    Image.asset("assets/images/logo_2.png",width: 120.w,height: 120.w,color: ThemeClass.primaryColor,),
                    Text("app_2desc".tr,style: TextStyle(fontSize: 30.sp,color: Colors.grey,),),
                  ],
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()async{
            setState(() {loading = true;});
            final bytes = await controller.capture();
            setState(() {loading = false;});
            widget.onConfirm(bytes);
          },
          child: Icon(Icons.check),
          backgroundColor: ThemeClass.primaryColor,
        ),
      ),
    );
  }
}



