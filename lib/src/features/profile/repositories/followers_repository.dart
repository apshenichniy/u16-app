import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:u16/src/core/core.dart';

part 'followers_repository.g.dart';

class FollowersRepository {
  FollowersRepository({required SupabaseClient supabaseClient})
      : _supabaseClient = supabaseClient;
  final SupabaseClient _supabaseClient;

  /// Returns count of [userId] followers.
  Future<int> getUserFollowersCount(String userId) async {
    final response = await _supabaseClient
        .from('followers')
        .select<PostgrestListResponse>(
          '*',
          const FetchOptions(count: CountOption.exact),
        )
        .eq('following_id', userId);
    return response.count ?? 0;
  }

  /// Returns count of [userId] followings.
  Future<int> getUserFollowingsCount(String userId) async {
    final response = await _supabaseClient
        .from('followers')
        .select<PostgrestListResponse>(
          '*',
          const FetchOptions(count: CountOption.exact),
        )
        .eq('follower_id', userId);
    return response.count ?? 0;
  }

  /// Returns true if the [userId] follows [otherId].
  Future<bool> isUserFollowsOther({
    required String userId,
    required String otherId,
  }) async {
    final response = await _supabaseClient
        .from('followers')
        .select<PostgrestListResponse>(
          '*',
          const FetchOptions(count: CountOption.exact),
        )
        .eq('follower_id', userId)
        .eq('following_id', otherId);

    return (response.count ?? 0) > 0;
  }

  /// Update [userId] follows [otherId].
  Future<void> follow({required String userId, required String otherId}) async {
    assert(userId != otherId, "User can't follow himself.");

    await _supabaseClient.from('followers').upsert({
      'follower_id': userId,
      'following_id': otherId,
    });
  }

  /// Update [userId] unfollows [otherId].
  Future<void> unfollow({
    required String userId,
    required String otherId,
  }) async {
    assert(userId != otherId, "User can't unfollow himself.");

    await _supabaseClient.from('followers').delete().match({
      'follower_id': userId,
      'following_id': otherId,
    });
  }
}

@riverpod
FollowersRepository followersRepository(FollowersRepositoryRef ref) {
  return FollowersRepository(supabaseClient: ref.read(supabaseClientProvider));
}
