import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utilities/theme_helper.dart';


// ignore: must_be_immutable
class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final bool? obscure;
  final String? hint;
  final Color? backGroundColor;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final int? maxLine, maxLength, widthSufIcon;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool? enable, isDense;
  final Color? borderColor, activeBorderColor;
  final double? borderRadiusValue, width;
  final EdgeInsets? insidePadding;
  final Widget? prefixIcon, suffixIcon;
  final FocusNode? myFocusNode;
  final void Function(String)? onchange;

  const CustomTextFieldWidget(
      {Key? key,
        this.isDense,
        this.style,
        this.onchange,
        this.insidePadding,
        this.validator,
        this.maxLine = 1,
        this.hint,
        this.backGroundColor,
        this.controller,
        this.obscure = false,
        this.enable = true,
        this.textInputType = TextInputType.text,
        this.borderColor,
        this.borderRadiusValue,
        this.prefixIcon,
        this.width,
        this.hintStyle,
        this.suffixIcon,
        this.activeBorderColor,
        this.maxLength,
        this.widthSufIcon = 30,
        this.myFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputBorder defaultBorder = OutlineInputBorder(
      borderSide: BorderSide(color: borderColor ?? const Color(0xff555555)),
      borderRadius: BorderRadius.circular(borderRadiusValue ?? 8.w),
    );
    return SizedBox(
      width: width ?? 1025.w,
      height: 150.h,
      child: TextFormField(
        textAlign: maxLine! > 2 ? TextAlign.start : TextAlign.start,
        validator: validator,
        focusNode: myFocusNode,
        enabled: enable,
        maxLength: maxLength,
        obscureText: obscure ?? false,
        controller: controller,

        decoration: InputDecoration(

          errorStyle: const TextStyle(height: 0),
          disabledBorder: defaultBorder,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadiusValue??8.w),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: activeBorderColor ?? ThemeClass.primaryColor,
            ),
            borderRadius: BorderRadius.circular(borderRadiusValue ?? 8.w),
          ),

          border: defaultBorder,

          isDense: isDense ?? false,
          prefixIconConstraints: BoxConstraints(
              minWidth: prefixIcon == null ? 0 : 100.w, maxHeight: 65.w),
          contentPadding: insidePadding ?? EdgeInsets.symmetric(vertical: 50.w, horizontal: 10.w),
          fillColor: backGroundColor,
          filled: backGroundColor != null,
          hintText: hint,
          prefixIcon: prefixIcon == null
              ? null : Container(
              width: 30.w,
              alignment: Alignment.topCenter,
              child: prefixIcon ?? const SizedBox()),
          suffixIcon: suffixIcon == null
              ? null
              : Container(
              width: widthSufIcon?.w,
              alignment: Alignment.center,
              child: suffixIcon ?? const SizedBox()),
          hintStyle: hintStyle ??
              TextStyle(
                fontSize: 16.sp,
                color: const Color(0xff555555),
              ),
        ),
        onChanged: onchange,
        textCapitalization: TextCapitalization.words,
        maxLines: maxLine ?? 1,
        keyboardType: textInputType,
        style: style ??
            TextStyle(
              fontSize: 35.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xff333333),
            ),
      ),
    );
  }
}
