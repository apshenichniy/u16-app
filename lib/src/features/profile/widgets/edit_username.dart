import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/auth/auth.dart';
import 'package:u16/src/l10n/l10n.dart';

class EditUsernameView extends ConsumerWidget {
  const EditUsernameView({required this.username, super.key});
  final String username;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(usernameAvailabilityControllerProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(state.valueOrNull?.whenOrNull(
              available: (username) => username,
            ) ??
            'not text'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(context.l10n.commonSave),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ltPadding),
        child: UsernameForm(
          initialValue: username,
        ),
      ),
    );
  }
}
