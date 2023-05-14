// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:adpro/config/core/extension/num.dart';
import 'package:adpro/config/core/resources/color_config.dart';
import 'package:adpro/config/util/input_txt.dart';
import 'package:adpro/features/auth/presentation/widgets/adproof_header.dart';
import 'package:adpro/features/auth/presentation/widgets/email_btn_wid.dart';
import 'package:adpro/features/auth/presentation/widgets/extra_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EmailSignUp extends StatelessWidget {
  const EmailSignUp({super.key, this.pageController});
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    // var sZx = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: BottomEmailWidget(),
        appBar: AdproofBar(
          cTap: true,
          onTap: () => pageController?.jumpToPage(0),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          physics: BouncingScrollPhysics(),
          children: [
            ExtraHeaderWid(),
            50.0.h,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputTextField(
                  labelText: 'First name',
                ),
                15.0.h,
                InputTextField(
                  labelText: 'Last name',
                ),
                15.0.h,
                InputTextField(
                  labelText: 'Email',
                ),
                15.0.h,
                InputTextField(
                  labelText: 'Password',
                  isObscure: true,
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.visibility_off,
                        color: ColorManager.kPrimColorII,
                        size: 15,
                      )),
                ),
              ]
                  .animate(interval: 200.ms)
                  .fade(duration: 900.ms, curve: Curves.easeOut),
            ),
          ],
        ));
  }
}
