// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:u16/src/features/auth/auth.dart';

part 'user_providers.g.dart';

@riverpod
Future<AppUser?> user(UserRef ref, {required String userId}) async {
  return ref.watch(usersRepositoryProvider).findUser(userId);
}

/// Should be consumed only after user authentication. Always has value,
/// otherwise throws [StateError].
@riverpod
Future<AppUser> currentUser(CurrentUserRef ref) async {
  ref.onDispose(() {
    log('!!!!!!!! CURRENT USER DISPOSE!');
  });

  final user = await ref.watch(usersRepositoryProvider).currentUser;
  if (user == null) {
    throw StateError('No user profile or authenticated user');
  }
  return user;
}
