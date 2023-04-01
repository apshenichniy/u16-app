import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:u16/src/features/auth/auth.dart';
import 'package:u16/src/features/profile/profile.dart';

@RoutePage()
class UserProfilePage extends ConsumerWidget {
  const UserProfilePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserId = ref.watch(currentUserIdProvider)!;

    return ProfileView(
      userId: currentUserId,
      isCurrentUser: true,
    );
  }
}
