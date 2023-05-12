// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../../features/auth/presentation/view/auth/auth_view.dart' as _i3;
import '../../../features/auth/presentation/view/auth/signin.dart' as _i4;
import '../../../features/auth/presentation/view/onboarding/onboarding.dart'
    as _i2;
import '../../../features/splash.dart' as _i1;

class AdproofRouter extends _i5.RootStackRouter {
  AdproofRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    OnboardingView.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.OnboardingView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    AuthMainView.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.AuthMainView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SignIn.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.SignIn(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i5.RouteConfig(
          OnboardingView.name,
          path: '/ONBOARDING_ROUTE',
        ),
        _i5.RouteConfig(
          AuthMainView.name,
          path: '/AUTH_ROUTE',
        ),
        _i5.RouteConfig(
          SignIn.name,
          path: '/SIGN_IN_ROUTE',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i5.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: '/',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.OnboardingView]
class OnboardingView extends _i5.PageRouteInfo<void> {
  const OnboardingView()
      : super(
          OnboardingView.name,
          path: '/ONBOARDING_ROUTE',
        );

  static const String name = 'OnboardingView';
}

/// generated route for
/// [_i3.AuthMainView]
class AuthMainView extends _i5.PageRouteInfo<void> {
  const AuthMainView()
      : super(
          AuthMainView.name,
          path: '/AUTH_ROUTE',
        );

  static const String name = 'AuthMainView';
}

/// generated route for
/// [_i4.SignIn]
class SignIn extends _i5.PageRouteInfo<void> {
  const SignIn()
      : super(
          SignIn.name,
          path: '/SIGN_IN_ROUTE',
        );

  static const String name = 'SignIn';
}
