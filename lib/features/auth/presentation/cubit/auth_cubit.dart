import 'dart:developer';

import 'package:adpro/config/core/enum/adproof_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial()) {
    functionSwitchBtw(SignupORSignIn.signUp);
  }

  functionSwitchBtw(SignupORSignIn signOrSignUpViaEmail) {
    emit(state.copyWith(signupORSignIn: signOrSignUpViaEmail));
    log('${{state.signupORSignIn}}');
  }
}
