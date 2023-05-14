// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:adpro/config/core/resources/color_config.dart';
import 'package:adpro/config/core/resources/textstyle_x.dart';
import 'package:adpro/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CustomAuthBtnWid extends StatelessWidget {
  const CustomAuthBtnWid({
    super.key,
    this.imgLabel,
    this.title,
    this.click,
  });

  final String? imgLabel, title;
  final Function()? click;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 30, left: 30),
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 4.5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: ColorManager.kPrimColorII,
              width: 0.5,
            )),
        child: ListTile(
          onTap: click,
          visualDensity: VisualDensity(vertical: 0),
          dense: true,
          contentPadding: EdgeInsets.zero,
          leading: Container(
            padding: EdgeInsets.all(9),
            decoration: BoxDecoration(
                border:
                    Border.all(color: ColorManager.kPrimColorII, width: 0.3),
                color: imgLabel == null
                    ? ColorManager.transparent
                    : ColorManager.kPrimColorII,
                shape: BoxShape.circle),
            child: Image.asset(
              imgLabel ?? Assets.images.png.logosGoogleIcon.path,
              height: 14,
            ),
          ),
          title: Transform.translate(
            offset: Offset(40, 0),
            child: Text(
              title ?? '',
              textAlign: TextAlign.left,
              style:
                  getBoldStyle(color: ColorManager.kPrimColorII, fontSize: 11),
            ),
          ),
        ));
  }
}
