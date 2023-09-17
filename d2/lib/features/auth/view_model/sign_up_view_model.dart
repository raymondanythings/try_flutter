import 'dart:async';

import 'package:d2/features/auth/repository/auth_repository.dart';
import 'package:d2/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepository;
  @override
  FutureOr<void> build() {
    _authRepository = ref.read(authRepository);
  }

  Future<void> signUp(
      String email, String password, BuildContext context) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await _authRepository.signUp(email, password),
    );

    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      context.pushReplacement('/');
    }
  }
}

final signUpFrom = StateProvider((ref) => {});
final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
