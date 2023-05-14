import 'package:adpro/config/core/resources/app_string.dart';
import 'package:adpro/config/core/resources/color_config.dart';
import 'package:adpro/config/core/resources/textstyle_x.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OtpHeader extends StatelessWidget {
  const OtpHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        AppString.otpVerification,
        style: getBoldStyle(
          color: ColorManager.black,
          fontSize: 18,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: AutoSizeText.rich(
          textAlign: TextAlign.left,
          TextSpan(
              text: AppString.otpV1,
              style: getRegularStyle(
                color: ColorManager.kPrimColor,
                fontSize: 12,
              ),
              children: [
                TextSpan(
                  text: AppString.otpv2,
                  style: getRegularStyle(
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
