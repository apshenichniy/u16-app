import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/auth/auth.dart';

@RoutePage()
class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});
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
                    final response =
                        await ref.read(supabaseClientProvider).functions.invoke(
                      'authenticate',
                      body: {},
                    );

                    print('!!!!!!!!! ${response.data}');

                    //log(response.data);
                  },
                  child: const Text('call authenticate'),
                ),
                Gaps.vGap10,
                FilledButton(
                  onPressed: () async {
                    ref.invalidate(currentUserProvider);
                  },
                  child: const Text('Invalidate Current user'),
                ),
                Gaps.vGap10,
                FilledButton(
                  onPressed: () async {
                    ref.invalidate(authenticationControllerProvider);
                  },
                  child: const Text('Invalidate auth'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
