import 'dart:async';

import 'package:adpro/config/core/di/injector.dart';
import 'package:adpro/config/core/route/nav_keys.dart';
import 'package:adpro/config/core/route/route.dart';
import 'package:adpro/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  bool hasCompleteSplash = false;
  splashTimer() async {
    timer = Timer(const Duration(seconds: 40), () {
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
    return Scaffold(
      body: SizedBox(
        height: s.height * 0.1,
        child: SvgPicture.asset(Assets.images.svg.adprofLogo),
      ),
    );
  }
}
