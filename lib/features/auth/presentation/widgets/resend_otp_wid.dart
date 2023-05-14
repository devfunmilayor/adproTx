// ignore_for_file: prefer_const_constructors

import 'package:adpro/config/core/resources/app_string.dart';
import 'package:adpro/config/core/resources/color_config.dart';
import 'package:adpro/config/core/resources/textstyle_x.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ResendOtpWid extends StatelessWidget {
  const ResendOtpWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      textAlign: TextAlign.center,
      TextSpan(
          text: AppString.didintReceive,
          style: getRegularStyle(
            color: ColorManager.kPrimColor,
            fontSize: 12,
          ),
          children: [
            TextSpan(
              text: AppString.codeResen,
              style: getBoldStyle(
                  color: ColorManager.kPinkColor,
                  fontSize: 12,
                  decoration: TextDecoration.underline),
            ),
          ]),
      minFontSize: 0,
      stepGranularity: 0.1,
    ).animate(delay: 100.ms).fade(
          curve: Curves.easeIn,
          duration: 300.ms,
        );
  }
}

class ContactUsWid extends StatelessWidget {
  const ContactUsWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      textAlign: TextAlign.center,
      TextSpan(
          text: AppString.havinProb,
          style: getRegularStyle(
            color: ColorManager.kPrimColor,
            fontSize: 12,
          ),
          children: [
            TextSpan(
              text: AppString.contactUs,
              style: getRegularStyle(
                color: ColorManager.black,
                fontSize: 12,
              ),
            ),
          ]),
      minFontSize: 0,
      stepGranularity: 0.1,
    ).animate(delay: 200.ms).fade(
          curve: Curves.easeIn,
          duration: 500.ms,
        );
  }
}
