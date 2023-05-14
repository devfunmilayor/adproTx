// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:adpro/config/core/enum/adproof_enum.dart';
import 'package:adpro/config/core/extension/num.dart';
import 'package:adpro/config/core/resources/app_string.dart';
import 'package:adpro/config/core/resources/color_config.dart';
import 'package:adpro/config/core/resources/textstyle_x.dart';
import 'package:adpro/config/util/input_txt.dart';
import 'package:adpro/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:adpro/features/auth/presentation/widgets/adproof_header.dart';
import 'package:adpro/features/auth/presentation/widgets/email_btn_wid.dart';
import 'package:adpro/features/auth/presentation/widgets/extra_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupSignView extends StatelessWidget {
  const SignupSignView({super.key, this.pageController});
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    // var sZx = MediaQuery.of(context).size;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            bottomNavigationBar: BottomEmailWidget(
              signUpFunction: () => pageController?.jumpToPage(2),
              signInFunction: () => context.read<AuthCubit>().functionSwitchBtw(
                  state.signupORSignIn == SignupORSignIn.signIn
                      ? SignupORSignIn.signUp
                      : SignupORSignIn.signIn),
            ),
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
                state.signupORSignIn == SignupORSignIn.signIn
                    ? 60.0.h
                    : SizedBox.shrink(),
                ExtraHeaderWid(
                  label: state.signupORSignIn == SignupORSignIn.signUp
                      ? AppString.emailStrl
                      : AppString.loginLabelTxt,
                ),
                state.signupORSignIn == SignupORSignIn.signUp ? 50.0.h : 80.0.h,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    state.signupORSignIn == SignupORSignIn.signIn
                        ? SizedBox.shrink()
                        : InputTextField(
                            labelText: 'First name',
                          ),
                    state.signupORSignIn == SignupORSignIn.signIn
                        ? SizedBox.shrink()
                        : 15.0.h,
                    state.signupORSignIn == SignupORSignIn.signIn
                        ? SizedBox.shrink()
                        : InputTextField(
                            labelText: 'Last name',
                          ),
                    state.signupORSignIn == SignupORSignIn.signIn
                        ? SizedBox.shrink()
                        : 15.0.h,
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
                    state.signupORSignIn == SignupORSignIn.signUp
                        ? SizedBox.shrink()
                        : 15.0.h,
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Visibility(
                        visible: state.signupORSignIn == SignupORSignIn.signIn,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Forget password?',
                            textAlign: TextAlign.left,
                            style: getBoldStyle(
                                color: ColorManager.black, fontSize: 11),
                          ),
                        ),
                      ),
                    ),
                  ]
                      .animate(interval: 200.ms)
                      .fade(duration: 900.ms, curve: Curves.easeOut),
                ),
              ],
            ));
      },
    );
  }
}
