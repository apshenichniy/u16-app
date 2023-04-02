import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/profile/profile.dart';

part 'profile_providers.g.dart';

@riverpod
Future<FollowersInfo> followersInfo(
  FollowersInfoRef ref, {
  required String userId,
}) async {
  ref.cacheFor(defaultCacheTime);

  final repository = ref.read(followersRepositoryProvider);
  final response = await Future.wait([
    repository.getUserFollowersCount(userId),
    repository.getUserFollowingsCount(userId),
  ]);

  return FollowersInfo(followers: response[0], followings: response[1]);
}
