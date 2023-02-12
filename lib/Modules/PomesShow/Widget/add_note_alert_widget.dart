import 'package:dwawin/Utilities/helper.dart';
import 'package:dwawin/Utilities/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: non_constant_identifier_names
AnimatedAlertAddNote(
    {required BuildContext context,
    required TextEditingController controller,
      required Function addNote
    }) async {
  showGeneralDialog(
    barrierLabel: "Label",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 400),
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 1017.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.w)),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: ThemeClass.primaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.w),
                            topLeft: Radius.circular(20.w))),
                    height: 70.h,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration:
                            BoxDecoration(color: ThemeClass.primaryColor),
                        height: 391.h,
                        width: 8.w,
                      ),
                      Material(
                        child: SizedBox(
                          width: 1001.w,
                          child: TextFormField(
                            maxLines: 5,
                            minLines: 5,
                            controller: controller,
                            decoration: InputDecoration(
                              hintText: "content_note".tr,
                              filled: true,
                              fillColor: Colors.white,
                              errorStyle: const TextStyle(height: 0),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.w, horizontal: 10.w),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: ThemeClass.primaryColor,
                        ),
                        height: 391.h,
                        width: 8.w,
                      ),
                    ],
                  ),
                  Material(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap:()=>addNote() ,
                          child: Container(
                              width: 505.w,
                              height: 150.h,
                              alignment: Alignment.center,
                              decoration:
                                  BoxDecoration(color: ThemeClass.primaryColor),
                              child: Text("add".tr,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 55.sp,
                                      color: Colors.white))),
                        ),
                        InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                                width: 505.w,
                                height: 150.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: ThemeClass.primaryColor),
                                child: Text(
                                  "delete".tr,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 55.sp,
                                      color: Colors.white),
                                )))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(anim1),
        child: child,
      );
    },
  );
}
