import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/profile/models/followers_info.dart';

part 'followers_repository.g.dart';

class FollowersRepository {
  FollowersRepository({required SupabaseClient supabaseClient})
      : _supabaseClient = supabaseClient;
  final SupabaseClient _supabaseClient;

  Future<FollowersInfo?> getFollowersInfo({required String userId}) async {
    final response = await Future.wait([
      _supabaseClient
          .from('followers')
          .select<PostgrestListResponse>(
            '*',
            const FetchOptions(count: CountOption.exact),
          )
          .eq('user_id', userId),
      _supabaseClient
          .from('followers')
          .select<PostgrestListResponse>(
            '*',
            const FetchOptions(count: CountOption.exact),
          )
          .eq('follower_id', userId)
    ]);

    return FollowersInfo(
      followers: response[0].count,
      subscriptions: response[1].count,
    );
  }
}

@riverpod
FollowersRepository followersRepository(FollowersRepositoryRef ref) {
  return FollowersRepository(supabaseClient: ref.read(supabaseClientProvider));
}
