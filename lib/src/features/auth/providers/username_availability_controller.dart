import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:u16/src/features/auth/auth.dart';

part 'username_availability_controller.freezed.dart';
part 'username_availability_controller.g.dart';

@riverpod
class UsernameAvailabilityController extends _$UsernameAvailabilityController {
  @override
  FutureOr<UsernameAvailabilityState> build() {
    return const UsernameAvailabilityState.initial();
  }

  Future<void> checkUsername(String value) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final user =
          await ref.read(usersRepositoryProvider).findUserByName(value);
      return (user == null || user.id == ref.read(currentUserIdProvider))
          ? UsernameAvailabilityState.available(username: value)
          : const UsernameAvailabilityState.alreadyRegistered();
    });
  }
}

@freezed
class UsernameAvailabilityState with _$UsernameAvailabilityState {
  const factory UsernameAvailabilityState.initial() = _Initial;
  const factory UsernameAvailabilityState.available({
    required String username,
  }) = _Available;
  const factory UsernameAvailabilityState.alreadyRegistered() =
      _AlreadyRegistered;
}
