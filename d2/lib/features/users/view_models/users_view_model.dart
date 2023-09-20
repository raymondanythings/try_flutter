import 'dart:async';

import 'package:d2/features/auth/repository/auth_repository.dart';
import 'package:d2/features/auth/view_model/sign_up_view_model.dart';
import 'package:d2/features/users/models/user_profile_model.dart';
import 'package:d2/features/users/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersViewModel extends AsyncNotifier<UserProfileModel> {
  late final UserRepository _usersRepository;
  late final AuthenticationRepository _authenticationRepository;

  @override
  FutureOr<UserProfileModel> build() async {
    _usersRepository = ref.read(userRepository);
    _authenticationRepository = ref.read(authRepository);
    if (_authenticationRepository.isLoggedIn) {
      final profile = await _usersRepository
          .findProfile(_authenticationRepository.user!.uid);
      if (profile != null) {
        return UserProfileModel.fromJson(profile);
      }
    }
    return UserProfileModel.enpty();
  }

  Future<void> createAccount(UserCredential credential) async {
    if (credential.user == null) {
      throw Exception("Account not created");
    } else {
      state = const AsyncValue.loading();
      final profile = UserProfileModel(
        hasAvatar: false,
        uid: credential.user!.uid,
        name: credential.user!.displayName ?? "Anon",
        email: credential.user!.email ?? "anon@anon.com",
        username: "anon",
        description: "empty.",
      );
      await _usersRepository.createProfile(profile);
      state = AsyncValue.data(profile);
    }
  }

  Future<void> onAvatarUpload() async {
    if (state.value != null) {
      state = AsyncValue.data(
        state.value!.copyWith(hasAvatar: true),
      );
      await _usersRepository.updateUser(state.value!.uid, {"hasAvatar": true});
    }
  }
}

final usersProvider = AsyncNotifierProvider<UsersViewModel, UserProfileModel>(
  () => UsersViewModel(),
);
