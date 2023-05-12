// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AdPro {
  static const SPLASH_ROUTE = '/';
  static const ONBOARDING_ROUTE = '/ONBOARDING_ROUTE';
  static const AUTH_ROUTE = '/AUTH_ROUTE';
  static const SIGN_IN_ROUTE = '/SIGN_IN_ROUTE';
}

Widget buildTransitions(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return FadeTransition(opacity: animation, child: child);
}
