// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:adpro/config/core/resources/color_config.dart';
import 'package:adpro/config/core/resources/textstyle_x.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Click2signin extends StatelessWidget {
  const Click2signin({super.key, this.click2signIn, this.hBx});

  final Function()? click2signIn;
  final double? hBx;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click2signIn,
      child: Container(
        height: hBx ?? 100,
        margin: EdgeInsets.only(bottom: 30),
        child: AutoSizeText.rich(
          textAlign: TextAlign.center,
          TextSpan(
              text: 'Have an account?',
              style: getMediumStyle(
                color: ColorManager.kPrimColor,
                fontSize: 11,
              ),
              children: [
                TextSpan(
                  text: ' Sign in',
                  style: getBoldStyle(
                    color: ColorManager.kPrimColorII,
                    fontSize: 12,
                  ),
                ),
              ]),
          minFontSize: 0,
          stepGranularity: 0.1,
        ).animate(delay: 1900.ms).fade(
              curve: Curves.easeIn,
              duration: 1500.ms,
            ),
      ),
    );
  }
}
