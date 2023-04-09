import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/auth/auth.dart';
import 'package:u16/src/gen/assets.gen.dart';
import 'package:u16/src/l10n/l10n.dart';

@RoutePage()
class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authenticationControllerProvider, (previous, next) {
      next
        ..showSnackbarOnError(context)
        ..whenData(
          (state) => state.maybeWhen(
            unauthenticated: () {
              // stay here
            },
            orElse: () => context.replaceRoute(state.route),
          ),
        );
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(ltPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    context.l10n.signInWelcomeToU16,
                    textAlign: TextAlign.center,
                    //style: Theme.of(context).customTheme.tHeading1,
                  ),
                  SvgPicture.asset(Assets.images.soccerArt),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 48,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const SignUpWithEmailPage(),
                          ),
                        );
                      },
                      child: Text(context.l10n.signInSignUpWithEmail),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(ltPadding / 2),
                    child: Text(
                      context.l10n.signInOr,
                      textAlign: TextAlign.center,
                      //style: Theme.of(context).customTheme.tHeading6Regular,
                    ),
                  ),
                  if (Platform.isIOS)
                    SizedBox(
                      height: 48,
                      child: FilledButton.icon(
                        style: FilledButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.inverseSurface,
                          foregroundColor:
                              Theme.of(context).colorScheme.onInverseSurface,
                        ),
                        icon: SvgPicture.asset(
                          Assets.images.appleIcon,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.onPrimary,
                            BlendMode.srcIn,
                          ),
                        ),
                        onPressed: () async {
                          await ref
                              .read(
                                authenticationControllerProvider.notifier,
                              )
                              .signInWithApple();
                        },
                        label: Text(context.l10n.signInContinueWithApple),
                      ),
                    ),
                  if (Platform.isAndroid)
                    SizedBox(
                      height: 48,
                      child: FilledButton.icon(
                        icon: SvgPicture.asset(
                          Assets.images.googleIcon,
                        ),
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xFFE5E7E8),
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () async {
                          await ref
                              .read(
                                authenticationControllerProvider.notifier,
                              )
                              .signInWithGoogle();
                        },
                        label: Text(context.l10n.signInContinueWithGoogle),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: ltPadding),
                    child: Text(
                      context.l10n.signInAlreadyHaveAnAccount,
                      textAlign: TextAlign.center,
                      //style: Theme.of(context).customTheme.tHeading6Regular,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (context) => const LogInPage(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                        ),
                        child: Text(context.l10n.signInLogIn),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
