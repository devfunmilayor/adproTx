import 'dart:async';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:adpro/config/core/di/injector.dart';
import 'package:adpro/config/core/resources/color_config.dart';
import 'package:adpro/config/core/resources/textstyle_x.dart';
import 'package:adpro/config/core/route/nav_keys.dart';
import 'package:adpro/config/core/route/route.dart';
import 'package:adpro/gen/assets.gen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  bool hasCompleteSplash = false;
  splashTimer() async {
    timer = Timer(const Duration(seconds: 6), () {
      si<NavigationService>().replaceWith(AdPro.ONBOARDING_ROUTE);
    });
  }

  @override
  void initState() {
    splashTimer();

    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          child: AutoSizeText.rich(
            textAlign: TextAlign.center,
            TextSpan(
                text: 'Designed by ',
                style: getBoldStyle(
                  color: ColorManager.kPrimColor,
                  fontSize: 11,
                ),
                children: [
                  TextSpan(
                    text: ' Peddle Technologies',
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
        body: Center(
            child: SizedBox(
                    height: s.height * 0.1,
                    child: Image.asset(
                      Assets.images.png.fullLogo.path,
                      height: 40,
                    )).animate(delay: 1200.ms).fade(
                  curve: Curves.easeIn,
                  duration: 1000.ms,
                )),
      ),
    );
  }
}
