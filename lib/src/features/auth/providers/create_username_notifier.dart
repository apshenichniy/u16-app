import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:u16/src/features/auth/auth.dart';

part 'create_username_notifier.g.dart';

@riverpod
class CreateUsernameNotifier extends _$CreateUsernameNotifier {
  @override
  FutureOr<CreateUsernameState> build() {
    return CreateUsernameState.initial;
  }

  Future<void> createUserProfile({
    required String username,
    required UserProfileType profileType,
    DateTime? dateOfBirth,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      // check whether username is already registered
      final user =
          await ref.watch(usersRepositoryProvider).findUserByName(username);

      if (user != null) {
        return CreateUsernameState.usernameAlreadyRegistered;
      }
      // create new user profile
      await ref.watch(usersRepositoryProvider).createUserProfile(
            username: username,
            dateOfBirth: dateOfBirth,
            profileType: profileType,
          );
      // update authentication state
      ref.invalidate(authenticationControllerProvider);

      return CreateUsernameState.success;
    });
  }
}

enum CreateUsernameState {
  initial,
  usernameAlreadyRegistered,
  success,
}
