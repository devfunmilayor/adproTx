// ignore_for_file: file_names

import 'package:adpro/config/core/resources/color_config.dart';
import 'package:adpro/config/core/resources/textstyle_x.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return SizedBox(
      height: s.height / 8,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 25.0, right: 25.0, top: 10, bottom: 25),
        child: AutoSizeText.rich(
          textAlign: TextAlign.center,
          softWrap: true,
          wrapWords: true,
          TextSpan(
              text: 'By starting a 7 days  free trial. You accept the',
              style: getRegularStyle(
                color: ColorManager.kPrimColor,
                fontSize: 11,
              ),
              children: [
                TextSpan(
                  text: ' Terms of Services ',
                  style: getBoldStyle(
                    color: ColorManager.kPrimColorII,
                    fontSize: 11,
                  ),
                ),
                TextSpan(
                  text: ' and the',
                  style: getRegularStyle(
                    color: ColorManager.kPrimColor,
                    fontSize: 11,
                  ),
                ),
                TextSpan(
                  text: ' Privacy Policy.',
                  style: getBoldStyle(
                    color: ColorManager.kPrimColorII,
                    fontSize: 11,
                  ),
                ),
                TextSpan(
                  text:
                      ' A monthly paid subscription will \nactivate and you will be charged \$12.99 if you do not cancel \nyour subscription at least 24 hours before the free trial \nperiod of 7 days comes to an end',
                  style: getRegularStyle(
                    color: ColorManager.black,
                    fontSize: 11,
                  ),
                ),
              ]),
          minFontSize: 0,
          stepGranularity: 0.1,
        ),
      ),
    );
  }
}
