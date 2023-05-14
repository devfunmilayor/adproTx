import 'package:adpro/config/core/route/route.dart';
import 'package:adpro/features/auth/presentation/view/auth/auth_view.dart';
import 'package:adpro/features/auth/presentation/view/auth/signin.dart';
import 'package:adpro/features/auth/presentation/view/onboarding/onboarding.dart';
import 'package:adpro/features/splash.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:universal_platform/universal_platform.dart';

class AdProof {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AdPro.SPLASH_ROUTE:
        return pageRoute(settings: settings, widget: const SplashScreen());

      case AdPro.ONBOARDING_ROUTE:
        return pageRoute(settings: settings, widget: const OnboardingView());

      case AdPro.AUTH_ROUTE:
        return pageRoute(settings: settings, widget: const AuthMainView());

      case AdPro.SIGN_IN_ROUTE:
        return pageRoute(settings: settings, widget: const SignIn());

      default:
        return pageRoute(settings: settings, widget: Container());
    }
  }
}

PageRoute pageRoute({required RouteSettings settings, required Widget widget}) {
  if (UniversalPlatform.isAndroid) {
    return PageTransition(
        settings: settings,
        child: widget,
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 400));
  } else if (UniversalPlatform.isIOS) {
    return PageTransition(
        settings: settings,
        child: widget,
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 400));
  } else {
    return PageTransition(
        settings: settings,
        child: widget,
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 400));
  }
}
