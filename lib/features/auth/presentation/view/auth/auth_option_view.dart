// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:adpro/config/core/enum/adproof_enum.dart';
import 'package:adpro/config/core/extension/num.dart';
import 'package:adpro/config/core/resources/app_string.dart';
import 'package:adpro/config/core/resources/color_config.dart';
import 'package:adpro/config/core/resources/textstyle_x.dart';
import 'package:adpro/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:adpro/features/auth/presentation/widgets/auth_wid_cont.dart';
import 'package:adpro/features/auth/presentation/widgets/click_sign.dart';
import 'package:adpro/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthOptionView extends StatelessWidget {
  const AuthOptionView({super.key, this.pageController});
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: Click2signin(
              click2signIn: () {
                context
                    .read<AuthCubit>()
                    .functionSwitchBtw(SignupORSignIn.signIn);
                pageController?.jumpToPage(1);
              },
            ),
            body: Column(
              children: [
                50.0.h,
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        Image.asset(
                          Assets.images.png.fullLogo.path,
                          height: 30,
                        ).animate(delay: 600.ms).fade(
                              curve: Curves.easeIn,
                              duration: 850.ms,
                            ),
                        20.0.h,
                        Text(
                          AppString.mainAuthStr,
                          textAlign: TextAlign.center,
                          style: getMediumStyle(
                              color: ColorManager.kPrimColorII, fontSize: 12),
                        ).animate(delay: 700.ms).fadeIn(
                              curve: Curves.easeIn,
                              duration: 900.ms,
                            ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        CustomAuthBtnWid(
                          click: () {
                            context
                                .read<AuthCubit>()
                                .functionSwitchBtw(SignupORSignIn.signUp);
                            pageController?.jumpToPage(1);
                          },
                          title: AppString.signUpwithEmail,
                          imgLabel: Assets.images.png.message.path,
                        ).animate(delay: 950.ms).fade(
                              curve: Curves.easeIn,
                              duration: 950.ms,
                            ),
                        20.0.h,
                        CustomAuthBtnWid(
                                title: AppString.signUpWithApple,
                                imgLabel: Assets.images.png.apple.path)
                            .animate(delay: 1050.ms)
                            .fade(
                              curve: Curves.easeIn,
                              duration: 1150.ms,
                            ),
                        20.0.h,
                        CustomAuthBtnWid(title: AppString.signUpWithgoogle)
                            .animate(delay: 1250.ms)
                            .fade(
                              curve: Curves.easeIn,
                              duration: 1450.ms,
                            ),
                        20.0.h,
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
