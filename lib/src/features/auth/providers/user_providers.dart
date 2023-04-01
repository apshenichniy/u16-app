import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/auth/auth.dart';

part 'user_providers.g.dart';

@riverpod
Future<AppUser?> user(UserRef ref, {required String userId}) async {
  return ref.read(usersRepositoryProvider).findUser(userId);
}

/// Should be consumed only after user authentication. Always has value,
/// otherwise throws [StateError].
@riverpod
Future<AppUser> currentUser(CurrentUserRef ref) async {
  final user = await ref.read(usersRepositoryProvider).currentUser;
  if (user == null) {
    throw StateError('No user profile or authenticated user');
  }
  return user;
}

@riverpod
String? currentUserId(CurrentUserIdRef ref) {
  return ref.read(supabaseClientProvider).auth.currentUser?.id;
}
