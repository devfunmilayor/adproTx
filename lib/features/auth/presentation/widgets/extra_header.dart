// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:adpro/config/core/extension/num.dart';
import 'package:adpro/config/core/resources/color_config.dart';
import 'package:adpro/config/core/resources/textstyle_x.dart';
import 'package:adpro/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ExtraHeaderWid extends StatelessWidget {
  const ExtraHeaderWid({
    super.key,
    this.label,
  });
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Image.asset(
            Assets.images.png.fullLogo.path,
            height: 30,
          ).animate(delay: 600.ms).fade(
                curve: Curves.easeIn,
                duration: 850.ms,
              ),
          20.0.h,
          Text(
            label ?? '',
            textAlign: TextAlign.center,
            style:
                getMediumStyle(color: ColorManager.kPrimColorII, fontSize: 12),
          ).animate(delay: 700.ms).fadeIn(
                curve: Curves.easeIn,
                duration: 900.ms,
              ),
        ],
      ),
    );
  }
}
