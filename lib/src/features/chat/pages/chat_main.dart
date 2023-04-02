import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/auth/auth.dart';
import 'package:u16/src/features/profile/widgets/profile_view.dart';

@RoutePage()
class ChatMainPage extends ConsumerWidget {
  const ChatMainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatPage'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(ltPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FilledButton(
                  onPressed: () {
                    ref
                        .read(authenticationControllerProvider.notifier)
                        .signOut();
                  },
                  child: const Text('Sign Out'),
                ),
                Gaps.vGap10,
                FilledButton(
                  onPressed: () async {
                    final users =
                        await ref.read(usersRepositoryProvider).findAllUsers();
                    log(users.toString());
                  },
                  child: const Text('List users'),
                ),
                Gaps.vGap10,
                FilledButton(
                  onPressed: () async {
                    ref.invalidate(authenticationControllerProvider);
                  },
                  child: const Text('Invalidate auth'),
                ),
                Gaps.vGap10,
                FilledButton(
                  onPressed: () async {
                    await context.router.pushWidget(
                      const ProfileView(
                        userId: 'fe40fbe6-02cf-4e37-9289-b17a031bf25d',
                      ),
                    );
                  },
                  child: const Text('Show user2'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
