import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/errors.dart';
import '../entities/user_data.dart';
import '../repositories/auth_repo.dart';
import '../repositories/user_repo.dart';

class AuthNotifier extends AsyncNotifier<UserData?> {
  late final authRepo = ref.read(authRepoProvider);
  late final userRepo = ref.read(userRepoProvider);

  @override
  Future<UserData?> build() async {
    final localUser = await authRepo.silentLogin();
    if (localUser == null) return null;
    final user = await userRepo.getUser(localUser.uid);
    return user;
  }

  Future<void> continueWithGoogle() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        final user = await authRepo.continueWithGoogle();
        try {
          return await userRepo.getUser(user.uid);
        } catch (err) {
          if (err != AppErrors.noUser) rethrow;
          await userRepo.setUser(user);
          return user;
        }
      },
    );
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        await authRepo.logout();
        return null;
      },
    );
  }

  Future<void> changeProfilePic(File image) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        final user = state.valueOrNull;
        if (user == null) return null;
        final url = await userRepo.uploadUserImage(user.uid, image);
        final newUser = user.copyWith(imageUrl: url);
        await userRepo.setUser(newUser);
        return user;
      },
    );
  }
}

final authNotifierProvider = AsyncNotifierProvider<AuthNotifier, UserData?>(
  AuthNotifier.new,
  name: 'auth_notifier',
);

final userProvider = Provider<UserData?>(
  (ref) {
    final userAsync = ref.watch(authNotifierProvider);
    return userAsync.map(
      data: (data) => data.value,
      error: (error) => error.valueOrNull,
      loading: (loading) => loading.valueOrNull,
    );
  },
  name: 'user',
);
