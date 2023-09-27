import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_final_project/features/authentication/repos/authentication_repo.dart';
import 'package:flutter_final_project/features/authentication/sign_up_screen.dart';
import 'package:flutter_final_project/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);
    state = await AsyncValue.guard(
      () async => await _authRepo.emailSignUp(
        form["email"],
        form["password"],
      ),
    );
    // if (state.hasError) {
    //   showFirebaseErrorSnack(context, state.error);
    // } else {
    //   context.goNamed(SignUpScreen.routeName);
    // }
  }
}

final signUpForm = StateProvider((ref) => {});

final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
