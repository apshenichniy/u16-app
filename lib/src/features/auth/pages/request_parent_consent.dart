import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/core/widgets/unfocus.dart';
import 'package:u16/src/features/auth/auth.dart';
import 'package:u16/src/l10n/l10n.dart';
import 'package:validators/validators.dart';

class RequestParentConsentPage extends ConsumerStatefulWidget {
  const RequestParentConsentPage({
    required this.dateOfBirth,
    super.key,
  });
  final DateTime dateOfBirth;

  @override
  ConsumerState<RequestParentConsentPage> createState() =>
      _RequestParentConsentPageState();
}

class _RequestParentConsentPageState
    extends ConsumerState<RequestParentConsentPage> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).customTheme;
    final isLoading = ref.watch(authenticationControllerProvider).isLoading;

    ref.listen(authenticationControllerProvider, (previous, next) {
      next
        ..showSnackbarOnError(context)
        ..whenData(
          (state) => state.whenOrNull(
            waitingForConsent: () => context.replaceRoute(state.route),
          ),
        );
    });

    return LoadingOverlay(
      isLoading: isLoading,
      child: Unfocus(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(context.l10n.requestConsentAppBarTitle),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: ltPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    context.l10n.requestConsentWellSendCode,
                    style: theme.tHeading6Regular,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: ltPadding),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText:
                              context.l10n.requestConsentParentEmailAddress,
                          suffixIcon: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 150),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.clear),
                              onPressed: _emailController.clear,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value != null) {
                            return isEmail(value)
                                ? null
                                : context.l10n.signUpEnterValidEmail;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  FilledButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await ref
                            .read(authenticationControllerProvider.notifier)
                            .createConsentRequest(
                              email: _emailController.text,
                              dateOfBirth: widget.dateOfBirth,
                            );
                      }
                    },
                    child: Text(context.l10n.commonSubmit),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
