import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/auth/auth.dart';
import 'package:u16/src/l10n/l10n.dart';

@RoutePage()
class VerifyConsentPage extends ConsumerStatefulWidget {
  const VerifyConsentPage({super.key});
  @override
  ConsumerState<VerifyConsentPage> createState() => _VerifyConsentPageState();
}

class _VerifyConsentPageState extends ConsumerState<VerifyConsentPage> {
  late List<TextStyle?> otpTextStyles;
  bool _clearText = false;
  String? _enteredCode;

  @override
  Widget build(BuildContext context) {
    ///final theme = Theme.of(context).customTheme;
    final colorScheme = Theme.of(context).colorScheme;

    ref.listen(authenticationControllerProvider, (previous, next) {
      next
        ..showSnackbarOnError(context)
        ..whenData((state) {
          state.whenOrNull(
            userProfileRequired: () => context.replaceRoute(state.route),
          );
        });
    });

    return LoadingOverlay(
      isLoading: ref.watch(authenticationControllerProvider).isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.verifyConsent),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: ltPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: ltPadding,
                  ),
                  Text(
                    context.l10n.verifyConsentEnterCode,
                    textAlign: TextAlign.center,
                    //tyle: theme.tHeading6Inter,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: ltPadding * 2),
                    child: OtpTextField(
                      fieldWidth: 50,
                      focusedBorderColor: colorScheme.primary,
                      clearText: _clearText,
                      showFieldAsBox: true,
                      //textStyle: theme.tHeading1,
                      onSubmit: (String value) {
                        setState(() {
                          _enteredCode = value;
                        });
                      }, // end onSubmit
                    ),
                  ),
                  FilledButton(
                    onPressed: _enteredCode != null
                        ? () async {
                            final isSuccess = await ref
                                .read(authenticationControllerProvider.notifier)
                                .verifyConsentRequest(code: _enteredCode!);
                            if (!isSuccess && context.mounted) {
                              context.showErrorSnackbar(
                                context.l10n.verifyConsentWrongCode,
                                onClose: (_) {
                                  setState(() {
                                    _clearText = false;
                                  });
                                },
                              );
                              setState(() {
                                _clearText = true;
                                _enteredCode = null;
                              });
                            }
                          }
                        : null,
                    child: const Text('Confirm'),
                  ),
                ],
              ),
              SafeArea(
                child: TextButton(
                  onPressed: () {
                    ref
                        .read(authenticationControllerProvider.notifier)
                        .signOut();
                  },
                  child: Text(context.l10n.authLogOut),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
