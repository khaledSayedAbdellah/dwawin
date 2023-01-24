import 'package:dwawin/Utilities/helper.dart';
import 'package:dwawin/Utilities/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ChangeLanguage extends StatelessWidget {
   int selectLanguage;
Function(int) onChange;
   ChangeLanguage({Key? key, required this.selectLanguage,required this.onChange}) : super(key: key);
  List<LanguageModel>languageModel=[
    LanguageModel(id: 0,name: "العربية"),
    LanguageModel(id: 1,name: "English"),
  ];
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context,StateSetter setState) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(50.w),topLeft: Radius.circular(50.w))
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(flex: 3,),
                  Text("language".tr,style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 49.sp,
                      color: ThemeClass.darkGray
                  ),),
                  const Spacer(flex: 2,),
                  IconButton(onPressed: ()=>Navigator.of(context).pop(), icon: Icon(Icons.close))
                ],
              ),
              Column(children:languageModel.map((e){
                return Column(
                  children: [
                    InkWell(
                      onTap: (){
                        onChange(e.id);
                        selectLanguage=e.id;
                        setState(() { });
                      },
                      splashColor: ThemeClass.primaryColor.withOpacity(.2),
                      highlightColor:ThemeClass.primaryColor.withOpacity(.4) ,
                      child: Container(
                        height: 100.h,
                        margin: EdgeInsetsDirectional.only(start: 137.w,end: 85.w),
                        child: Row(
                          children: [
                            Text(e.name,style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 49.sp,
                              color: ThemeClass.thirdColor
                            ),),
                            const Spacer(),
                            Icon(selectLanguage==e.id? Icons.check_circle:
                            Icons.circle_outlined,
                              size: 80.w,
                              color:ThemeClass.primaryColor ,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 1012.w,
                        child: Divider(
                          thickness: 1.h,
                          color: ThemeClass.secondDarkGray,
                        ))
                  ],
                );
              }).toList(),),
              SizedBox(height: 50.h,),
            ],
          ),
        );
      }
    );
  }
}
class LanguageModel{
  int id;
  String name;
  LanguageModel({required this.id,required this.name});
}