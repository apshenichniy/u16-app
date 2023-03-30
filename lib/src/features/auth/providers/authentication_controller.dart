import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/auth/auth.dart';

part 'authentication_controller.freezed.dart';
part 'authentication_controller.g.dart';
part 'authentication_state.dart';

@Riverpod(keepAlive: true)
class AuthenticationController extends _$AuthenticationController {
  @override
  FutureOr<AuthenticationState> build() {
    return ref.read(authServiceProvider).authenticate();
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    try {
      await ref.read(routerProvider).replaceAll([const SignInRoute()]);
      await Future<void>.delayed(const Duration(milliseconds: 300));
      await ref.read(authServiceProvider).signOut();
      state = const AsyncData(AuthenticationState.unauthenticated());
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  Future<void> signInWithPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    try {
      await ref
          .read(authServiceProvider)
          .signInWithPassword(email: email, password: password);
      ref.invalidateSelf();
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  Future<void> signUpWithPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(authServiceProvider)
          .signUpWithPassword(email: email, password: password);
      return const AuthenticationState.ageCheckRequired();
    });
  }

  Future<void> signInWithApple() async {
    state = const AsyncLoading();
    try {
      await ref.read(authServiceProvider).signInWithApple();
      ref.invalidateSelf();
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncLoading();
    try {
      await ref.read(authServiceProvider).signInWithGoogle();
      ref.invalidateSelf();
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  Future<void> createConsentRequest({
    required String email,
    required DateTime dateOfBirth,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(authServiceProvider)
          .createConsentRequest(email: email, dateOfBirth: dateOfBirth);
      return const AuthenticationState.waitingForConsent();
    });
  }

  Future<bool> verifyConsentRequest({required String code}) async {
    var result = false;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response =
          await ref.read(authServiceProvider).verifyConsentRequest(code: code);

      if (response) {
        result = true;
        return const AuthenticationState.userProfileRequired();
      } else {
        return const AuthenticationState.waitingForConsent();
      }
    });
    return result;
  }
}
