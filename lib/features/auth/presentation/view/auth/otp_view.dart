// ignore_for_file: prefer_const_constructors

import 'package:adpro/config/core/extension/num.dart';
import 'package:adpro/config/util/addproof_btn.dart';
import 'package:adpro/features/auth/presentation/widgets/adproof_header.dart';
import 'package:adpro/features/auth/presentation/widgets/otp_header.dart';
import 'package:adpro/features/auth/presentation/widgets/resend_otp_wid.dart';
import 'package:adpro/features/auth/presentation/widgets/timer_wid.dart';
import 'package:adpro/features/auth/presentation/widgets/verify_wid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key, this.pageController});
  final PageController? pageController;

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> with TickerProviderStateMixin {
  late AnimationController controller;

  String get timerString {
    Duration duration = controller.duration! * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );

    controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
  }

  @override
  void didUpdateWidget(OtpView oldWidget) {
    super.didUpdateWidget(oldWidget);
    controller.duration = const Duration(minutes: 10);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  var bar = VerifyCodeBarType2(code: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AdproofBar(
          cTap: true,
          onTap: () => widget.pageController?.jumpToPage(1),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          physics: const BouncingScrollPhysics(),
          children: [
            20.0.h,
            const OtpHeader(),
            25.0.h,
            TimerTxtWid(timerString: timerString).animate(delay: 1900.ms).fade(
                  curve: Curves.easeIn,
                  duration: 1500.ms,
                ),
            30.0.h,
            bar,
            20.0.h,
            CustomBtn(
              click: () => widget.pageController?.jumpToPage(3),
              label: 'Proceed',
            ),
            30.0.h,
            ResendOtpWid(),
            20.0.h,
            ContactUsWid()
          ]
              .animate(interval: 200.ms)
              .fade(duration: 700.ms, curve: Curves.easeIn),
        ));
  }
}
