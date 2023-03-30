import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:u16/src/features/auth/providers/user_providers.dart';

@RoutePage()
class UserProfilePage extends ConsumerWidget {
  const UserProfilePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider).valueOrNull;

    return Scaffold(
      appBar: AppBar(
        title: Text(user?.username ?? 'loading'),
      ),
      body: const Center(
        child: Text('UserProfilePage'),
      ),
    );
  }
}
