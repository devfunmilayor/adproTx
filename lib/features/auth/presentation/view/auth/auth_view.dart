// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:adpro/features/auth/presentation/view/auth/auth_option_view.dart';
import 'package:adpro/features/auth/presentation/view/auth/otp_view.dart';
import 'package:adpro/features/auth/presentation/view/auth/signup_signin_view.dart';
import 'package:adpro/features/auth/presentation/view/auth/terms_condition.dart';
import 'package:flutter/material.dart';

class AuthMainView extends StatefulWidget {
  const AuthMainView({super.key});

  @override
  State<AuthMainView> createState() => _AuthMainViewState();
}

class _AuthMainViewState extends State<AuthMainView> {
  bool enableBiometric = false;
  final _pageViewController = PageController();
  double currentPage = 0.0;
  List<Widget>? screens;
  @override
  void initState() {
    screens = [
      AuthOptionView(pageController: _pageViewController),
      SignupSignView(pageController: _pageViewController),
      OtpView(pageController: _pageViewController),
      TermsAndConditionView(pageController: _pageViewController),
    ];

    _pageViewController.addListener(() {
      setState(() {
        currentPage = _pageViewController.page!;
      });
    });

    super.initState();
  }

  @override
  void didUpdateWidget(AuthMainView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageViewController,
      itemCount: screens?.length,
      itemBuilder: (BuildContext context, int index) {
        return screens![index];
      },
    );
  }
}
