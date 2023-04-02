import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:u16/src/features/auth/auth.dart';
import 'package:u16/src/features/profile/profile.dart';

part 'follow_other_user_controller.g.dart';

@riverpod
class FollowOtherUserController extends _$FollowOtherUserController {
  @override
  Future<bool> build({required String otherId}) async {
    final currentUserId = ref.watch(currentUserIdProvider)!;

    return ref
        .read(followersRepositoryProvider)
        .isUserFollowsOther(userId: currentUserId, otherId: otherId);
  }

  Future<void> follow() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final currentUserId = ref.watch(currentUserIdProvider)!;
      await ref
          .read(followersRepositoryProvider)
          .follow(userId: currentUserId, otherId: otherId);
      ref
        ..invalidate(followersInfoProvider(userId: otherId))
        ..invalidate(followersInfoProvider(userId: currentUserId));
      return true;
    });
  }

  Future<void> unfollow() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final currentUserId = ref.watch(currentUserIdProvider)!;
      await ref
          .read(followersRepositoryProvider)
          .unfollow(userId: currentUserId, otherId: otherId);
      ref
        ..invalidate(followersInfoProvider(userId: otherId))
        ..invalidate(followersInfoProvider(userId: currentUserId));
      return false;
    });
  }
}
