// ignore_for_file: prefer_const_constructors

import 'package:adpro/config/core/resources/color_config.dart';
import 'package:adpro/config/core/resources/textstyle_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {Key? key,
      required this.labelText,
      this.controller,
      this.inputformatters,
      this.textAlign = TextAlign.left,
      this.onEditingComplete,
      this.suffixIcon,
      this.textInputAction,
      this.error,
      this.inputType = TextInputType.text,
      this.onChanged,
      this.onSaved,
      this.initialValue,
      this.styleX,
      this.prefix,
      this.validate})
      : super(key: key);

  final String labelText;
  final Function(String?)? onSaved;
  final String? Function(String?)? validate;

  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final Widget? prefix;
  final TextAlign textAlign;
  final TextInputAction? textInputAction;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputformatters;
  final Widget? suffixIcon;
  final VoidCallback? onEditingComplete;
  final String? initialValue, error;
  final TextStyle? styleX;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        inputFormatters: inputformatters,
        cursorColor: ColorManager.textFiledColor,
        validator: validate,
        keyboardType: inputType,
        onChanged: onChanged,
        textAlign: textAlign,
        cursorHeight: 15,
        cursorWidth: 1,
        style: styleX ??
            getRegularStyle(
              color: ColorManager.black,
              fontSize: 11,
            ),
        decoration: InputDecoration(
          prefixIcon: prefix,
          isDense: true,
          suffixIcon: suffixIcon,
          labelText: labelText,

          errorText: error,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          errorMaxLines: 1,
          errorStyle: getRegularStyle(
            color: Colors.red,
            fontSize: 11.sp,
          ),

          filled: false,
          fillColor: ColorManager.fundCard,

          labelStyle: getRegularStyle(color: ColorManager.black, fontSize: 9),
          // prefix: prefix,
          hintStyle: getRegularStyle(color: ColorManager.black, fontSize: 12),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          // alignLabelWithHint: true,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.error,
              // width: AppSize.s1_5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: ColorManager.grey.withOpacity(0.15)),
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.error,
              ),
              borderRadius: BorderRadius.circular(10.r)),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.grey.withOpacity(0.15)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: ColorManager.grey.withOpacity(0.15)),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 20,
            minHeight: 20,
          ),
        ),
      ),
    );
  }
}
