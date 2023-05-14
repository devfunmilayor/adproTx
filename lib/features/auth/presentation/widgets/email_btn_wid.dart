// ignore_for_file: prefer_const_constructors

import 'package:adpro/config/core/enum/adproof_enum.dart';
import 'package:adpro/config/core/extension/num.dart';
import 'package:adpro/config/core/resources/color_config.dart';
import 'package:adpro/config/core/resources/textstyle_x.dart';
import 'package:adpro/config/util/addproof_btn.dart';
import 'package:adpro/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomEmailWidget extends StatelessWidget {
  const BottomEmailWidget({
    super.key,
    this.signUpFunction,
    this.signInFunction,
  });

  final Function()? signUpFunction, signInFunction;

  @override
  Widget build(BuildContext context) {
    var sZx = MediaQuery.of(context).size;
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(top: 30, bottom: 30, left: 25, right: 25),
          height: state.signupORSignIn == SignupORSignIn.signIn
              ? sZx.height / 4
              : sZx.height / 5,
          child: Column(
            children: [
              CustomBtn(
                label: state.signupORSignIn == SignupORSignIn.signUp
                    ? 'Sign up'
                    : 'Sign in',
                click: signUpFunction,
              ).animate(delay: 2100.ms).fade(
                    curve: Curves.easeIn,
                    duration: 2000.ms,
                  ),
              20.0.h,
              GestureDetector(
                onTap: signInFunction,
                child: AutoSizeText.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                      text: 'Have an account?',
                      style: getMediumStyle(
                        color: ColorManager.kPrimColor,
                        fontSize: 11,
                      ),
                      children: [
                        TextSpan(
                          text: state.signupORSignIn == SignupORSignIn.signUp
                              ? ' Sign in'
                              : ' Sign up',
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
            ],
          ),
        );
      },
    );
  }
}
