// ignore_for_file: must_be_immutable, unnecessary_null_comparison, prefer_is_empty, library_private_types_in_public_api

import 'package:adpro/config/core/resources/color_config.dart';
import 'package:adpro/config/core/resources/textstyle_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyTextBox extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController nextController;
  final FocusNode currentNode;
  final FocusNode? nextNode;
  final Function()? refresh;
  final FocusNode? preNode;
  final int lineNumber;
  final Color? textFieldBackgroundColor;
  final Color? hintColor;
  final double fontSize;
  final AutovalidateMode autovalidateMode;
  List<TextInputFormatter>? formatter;
  VerifyTextBox(
      {super.key,
      required this.controller,
      required this.nextController,
      required this.currentNode,
      required this.nextNode,
      required this.preNode,
      this.refresh,
      this.formatter,
      this.autovalidateMode = AutovalidateMode.disabled,
      this.lineNumber = 1,
      this.textFieldBackgroundColor = const Color.fromRGBO(243, 243, 243, 1),
      this.hintColor = const Color.fromRGBO(114, 112, 112, 1),
      this.fontSize = 15});
  @override
  _VerifyTextBoxState createState() => _VerifyTextBoxState();
}

class _VerifyTextBoxState extends State<VerifyTextBox> {
  bool toggle = true;
  @override
  Widget build(BuildContext context) {
    var dimension = MediaQuery.of(context).size;
    return SizedBox(
      child: Theme(
        data: ThemeData(
            hintColor: Colors.green,
            inputDecorationTheme: const InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.green)),
            primaryColor: ColorManager.kPrimColorII,
            dividerColor: Colors.green),
        child: TextFormField(
          cursorColor: ColorManager.kPrimColorII,
          cursorHeight: 10.h,
          cursorWidth: 1.5,
          focusNode: widget.currentNode,
          autovalidateMode: widget.autovalidateMode,
          controller: widget.controller,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          textAlign: TextAlign.center,
          maxLines: widget.lineNumber,
          onChanged: (value) {
            if (widget.controller.text.length > 0 && widget.nextNode == null) {
              widget.refresh;
              return;
            }
            if (value.length != 0) {
              if (value.length > 1) {
                widget.controller.text = value.characters.first;
              } else {
                widget.controller.text = value;
              }

              if (widget.nextNode != null) {
                FocusScope.of(context).requestFocus(widget.nextNode);
              }
            } else if (value.length <= 0) {
              if (widget.preNode != null) {
                FocusScope.of(context).requestFocus(widget.preNode);
              }
            }
            widget.refresh;
          },
          style: getBoldStyle(color: ColorManager.black, fontSize: 20),
          decoration: InputDecoration(
            counterText: '',
            hintStyle: TextStyle(
                fontSize: widget.fontSize,
                fontWeight: FontWeight.w500,
                color: widget.hintColor,
                fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily),
            focusColor: ColorManager.kPrimColor,
            filled: true,
            fillColor: ColorManager.filledColor,
            alignLabelWithHint: true,
            hintMaxLines: widget.lineNumber,
            helperText: ' ',
            errorMaxLines: 1,
            contentPadding: EdgeInsets.only(top: dimension.height * 0.04),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(dimension.width * 0.05),
              borderSide: BorderSide(
                color: ColorManager.kPrimColorII,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(dimension.width * 0.026),
              borderSide: BorderSide(
                color: ColorManager.kPrimColor.withOpacity(0.3),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(dimension.width * 0.026),
              // borderRadius: BorderRadius.circular(dimension.width * 0.03),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(dimension.width * 0.026),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            isDense: false,
          ),
        ),
      ),
    );
  }
}
