// ignore_for_file: prefer_const_constructors

import 'package:adpro/config/core/extension/num.dart';
import 'package:adpro/config/core/resources/app_string.dart';
import 'package:adpro/config/core/resources/color_config.dart';
import 'package:adpro/config/core/resources/textstyle_x.dart';
import 'package:adpro/config/util/addproof_btn.dart';
import 'package:adpro/features/auth/presentation/widgets/adproof_header.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TermsAndConditionView extends StatelessWidget {
  const TermsAndConditionView({super.key, this.pageController});
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    var sXs = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: sXs.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [ColorManager.kPinkColor, ColorManager.btnColorDefault],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: Container(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 60, bottom: 90),
              height: sXs.height / 4,
              decoration: BoxDecoration(
                color: ColorManager.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 70.0,
                    blurRadius: 40,
                    offset: Offset(-20, 0),
                  ),
                ],
              ),
              child: CustomBtn(
                label: 'Accept and continue',
              ),
            ),
            appBar: AdproofBar(
              enableBg: true,
              cTap: true,
              onTap: () => pageController?.jumpToPage(2),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              height: sXs.height,
              margin: EdgeInsets.only(top: 30, left: 30, right: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: ColorManager.white,
              ),
              child: ListView(
                children: [
                  privacyWidR(),
                  30.0.h,
                  Text(
                    AppString.randii,
                    textAlign: TextAlign.left,
                    style: getBoldStyle(
                      color: ColorManager.kPrimColorII,
                      fontSize: 12.5,
                    ),
                  ),
                  20.0.h,
                  rowTxtW(lable: AppString.ra),
                  rowTxtW(lable: AppString.ra),
                  rowTxtW(lable: AppString.ra),
                  rowTxtW(lable: AppString.ra),
                  rowTxtW(lable: AppString.ra),
                  20.0.h,
                  AutoSizeText.rich(
                    textAlign: TextAlign.left,
                    TextSpan(
                        text: AppString.privacyI,
                        style: getRegularStyle(
                          color: ColorManager.kPrimColor,
                          fontSize: 10,
                        ),
                        children: [
                          TextSpan(
                            text: AppString.privacyPi,
                            style: getMediumStyle(
                              color: ColorManager.kPrimColorII,
                              fontSize: 10,
                            ),
                          ),
                        ]),
                    minFontSize: 0,
                    stepGranularity: 0.1,
                  )
                ]
                    .animate(interval: 250.ms)
                    .fade(duration: 400.ms, curve: Curves.easeOut),
              ),
            ),
          ),
        )
      ],
    );
  }
}
