// ignore_for_file: prefer_const_constructors

import 'package:adpro/config/core/extension/num.dart';
import 'package:adpro/config/core/resources/color_config.dart';
import 'package:adpro/config/core/resources/textstyle_x.dart';
import 'package:adpro/features/auth/data/models/onboarding_model.dart';
import 'package:adpro/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingWid extends StatelessWidget {
  const OnboardingWid({
    super.key,
    this.q,
  });

  final Onboarding? q;

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 60),
      child: Column(
        children: [
          Text(
            q?.t1 ?? '',
            textAlign: TextAlign.center,
            style:
                getMediumStyle(color: ColorManager.kPrimColorII, fontSize: 25),
          ),
          40.0.h,
          Image.asset(
            Assets.images.png.clarityImageGallerySolid.path,
            height: s.height * 0.2,
          ),
          20.0.h,
          Text(
            q?.t2 ?? '',
            textAlign: TextAlign.center,
            style:
                getMediumStyle(color: ColorManager.kPrimColorII, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class FadingWidet extends StatelessWidget {
  final Widget child;
  final bool isActive, wasActive;
  const FadingWidet(
      {super.key,
      required this.child,
      required this.isActive,
      required this.wasActive});

  @override
  Widget build(BuildContext context) {
    if (!wasActive && !isActive) {
      return const SizedBox();
    }

    // return body;
    return isActive
        ? child.animate().fadeIn(
              duration: const Duration(milliseconds: 550),
            )
        : child.animate().fadeOut(
              delay: 100.0.ms,
              duration: const Duration(milliseconds: 550),
            );
  }
}
