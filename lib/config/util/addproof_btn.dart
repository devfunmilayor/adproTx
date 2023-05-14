import 'package:adpro/config/core/resources/color_config.dart';
import 'package:adpro/config/core/resources/textstyle_x.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    this.click,
    this.label,
    this.isLoading = false,
  });

  final Function()? click;
  final String? label;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
        decoration: BoxDecoration(
          color: ColorManager.btnColorDefault,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Text(
          label ?? '',
          style: getBoldStyle(
            fontSize: 11,
            color: ColorManager.kPrimColorII,
          ),
        ),
      ),
    );
  }
}
