import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:u16/src/features/profile/profile.dart';

part 'profile_providers.g.dart';

@riverpod
Future<FollowersInfo?> followersInfo(
  FollowersInfoRef ref, {
  required String userId,
}) {
  return ref.read(followersRepositoryProvider).getFollowersInfo(userId: userId);
}
