import 'package:adpro/config/core/resources/app_string.dart';
import 'package:adpro/config/core/resources/color_config.dart';
import 'package:adpro/config/core/resources/textstyle_x.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TimerTxtWid extends StatelessWidget {
  const TimerTxtWid({
    super.key,
    this.timerString,
  });

  final String? timerString;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      textAlign: TextAlign.left,
      TextSpan(
          text: AppString.estimatedTimer,
          style: getRegularStyle(
            color: ColorManager.kPrimColor,
            fontSize: 12,
          ),
          children: [
            TextSpan(
              text: timerString,
              style: getRegularStyle(
                color: ColorManager.kPinkColor,
                fontSize: 12,
              ),
            ),
          ]),
      minFontSize: 0,
      stepGranularity: 0.1,
    );
  }
}
