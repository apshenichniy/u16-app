import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/auth/auth.dart';
import 'package:u16/src/l10n/l10n.dart';

@RoutePage()
class InitialSplashPage extends ConsumerWidget {
  const InitialSplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authenticationControllerProvider, (prev, next) {
      next.whenOrNull(
        data: (state) => context.replaceRoute(state.route),
        error: (error, stackTrace) {
          next.showSnackbarOnError(context);
          logger.e(
            "Can't resolve authentication state",
            next.error,
            next.stackTrace,
          );
          // sign out
          ref.read(authenticationControllerProvider.notifier).signOut();
        },
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text(context.l10n.authSplashMessage),
          ],
        ),
      ),
    );
  }
}
