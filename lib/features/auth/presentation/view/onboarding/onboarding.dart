// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks

import 'dart:async';

import 'package:adpro/config/core/di/injector.dart';
import 'package:adpro/config/core/extension/num.dart';
import 'package:adpro/config/core/resources/app_string.dart';
import 'package:adpro/config/core/resources/color_config.dart';
import 'package:adpro/config/core/resources/textstyle_x.dart';
import 'package:adpro/config/core/route/nav_keys.dart';
import 'package:adpro/config/core/route/route.dart';
import 'package:adpro/config/util/addproof_btn.dart';
import 'package:adpro/features/auth/data/models/onboarding_model.dart';
import 'package:adpro/features/auth/presentation/widgets/onboarding_wid.dart';
import 'package:adpro/features/auth/presentation/widgets/skip_signin.dart';
import 'package:adpro/features/auth/presentation/widgets/terms&condition.dart';
import 'package:adpro/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController pageController;
  Timer? timer;
  ValueNotifier<int> currentPage = ValueNotifier<int>(0);
  int previousPage = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();

    pageController.addListener(() {
      previousPage = currentPage.value;
      currentPage.value = pageController.page!.round();
    });

    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (pageController.hasClients) {
        if (pageController.page == 3) {
          timer.cancel();
          // pageController.animateToPage(0,
          //     duration: const Duration(milliseconds: 350),
          //     curve: Curves.easeIn);
        } else {
          pageController.nextPage(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeIn);
        }
      }
    });
  }

  final pages = [
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  // final colors = [
  //   Colors.red,
  //   Colors.black,
  //   Colors.blue,
  //   Colors.green,
  // ];

  @override
  Widget build(BuildContext context) {
    var sXs = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar:
              const TermsCondition().animate(delay: 1200.ms).fade(
                    curve: Curves.easeIn,
                    duration: 1000.ms,
                  ),
          body: Container(
            margin: EdgeInsets.only(left: 25, right: 25, top: 50, bottom: 0),
            child: Column(
              children: [
                Expanded(
                  // flex: 5,
                  child: Stack(
                    children: [
                      PageView(
                        controller: pageController,
                        children: [
                          ...pages,
                        ],
                      ),
                      Positioned(
                          top: 30,
                          right: 0,
                          left: 0,
                          child: SafeArea(
                            child: ValueListenableBuilder(
                                valueListenable: currentPage,
                                builder: (context, s, child) {
                                  return Stack(
                                    fit: StackFit.passthrough,
                                    children: [
                                      for (var i = 0;
                                          i < onboardingModel.length;
                                          i++)
                                        Center(
                                          child: FadingWidet(
                                              isActive: s == i,
                                              wasActive: i == previousPage,
                                              child: Text(
                                                onboardingModel[i].t1 ?? '',
                                                textAlign: TextAlign.center,
                                                style: getMediumStyle(
                                                    color: ColorManager
                                                        .kPrimColorII,
                                                    fontSize: 25),
                                              )),
                                        ),
                                    ],
                                  );
                                }),
                          )),
                      Positioned(
                        top: 130,
                        right: 0,
                        left: 0,
                        child: ValueListenableBuilder(
                                valueListenable: currentPage,
                                builder: (context, s, child) {
                                  return Stack(
                                    fit: StackFit.passthrough,
                                    children: [
                                      for (var i = 0;
                                          i < onboardingModel.length;
                                          i++)
                                        Center(
                                          child: FadingWidet(
                                              isActive: s == i,
                                              wasActive: i == previousPage,
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    Assets
                                                        .images
                                                        .png
                                                        .clarityImageGallerySolid
                                                        .path,
                                                    height: sXs.height * 0.2,
                                                  ),
                                                  20.0.h,
                                                  Text(
                                                    onboardingModel[i].t2 ?? '',
                                                    textAlign: TextAlign.center,
                                                    style: getMediumStyle(
                                                        color: ColorManager
                                                            .kPrimColorII,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              )),
                                        ),
                                    ],
                                  );
                                }).animate(delay: 300.ms).fade(
                              curve: Curves.easeIn,
                              duration: 500.ms,
                            ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 0,
                    child: ValueListenableBuilder(
                      valueListenable: currentPage,
                      builder: (context, value, child) {
                        return value == 3
                            ? Center(
                                child: Text(
                                'Continue',
                                style: getBoldStyle(
                                    color: ColorManager.kPinkColor,
                                    fontSize: 11),
                              ).animate(delay: 200.ms).fade(
                                      curve: Curves.easeOut,
                                      duration: 300.ms,
                                    ))
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  onboardingModel.length,
                                  (index) {
                                    return AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      margin: const EdgeInsets.only(right: 5),
                                      height: 6,
                                      width: value == index ? 20 : 6,
                                      decoration: BoxDecoration(
                                        color: value == index
                                            ? ColorManager.kPinkColor
                                            : ColorManager.kPinkColor
                                                .withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ).animate().fade(
                                          delay: 200.0.ms,
                                          curve: Curves.easeOut,
                                          duration:
                                              const Duration(milliseconds: 550),
                                        );
                                  },
                                ),
                              );
                      },
                    ).animate(delay: 500.ms).fade(
                          curve: Curves.easeIn,
                          duration: 700.ms,
                        )),
                42.0.h,
                Expanded(
                    flex: 0,
                    child: SizedBox(
                      child: Column(
                        children: [
                          Text(
                            AppString.adblocker,
                            textAlign: TextAlign.center,
                            style: getRegularStyle(
                              fontSize: 12,
                              color: ColorManager.kPrimColor,
                            ),
                          ),
                          22.0.h,
                          CustomBtn(
                            label: 'Register for free',
                            click: () => si<NavigationService>()
                                .replaceWith(AdPro.AUTH_ROUTE),
                          ),
                          SkipOrSignIn(),
                          12.0.h,
                        ],
                      ),
                    ).animate(delay: 700.ms).fade(
                          curve: Curves.easeIn,
                          duration: 900.ms,
                        ))
              ],
            ),
          )),
    );
  }
}
