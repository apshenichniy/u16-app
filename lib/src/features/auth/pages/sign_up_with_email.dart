import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/core/widgets/unfocus.dart';
import 'package:u16/src/features/auth/auth.dart';
import 'package:u16/src/l10n/l10n.dart';
import 'package:validators/validators.dart';

class SignUpWithEmailPage extends ConsumerStatefulWidget {
  const SignUpWithEmailPage({super.key});

  @override
  ConsumerState<SignUpWithEmailPage> createState() =>
      _SignUpWithEmailPageState();
}

class _SignUpWithEmailPageState extends ConsumerState<SignUpWithEmailPage> {
  final _emailFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordFormKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _isPasswordsHidden = true;
  bool _isPasswordFormValid = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  String? _validatePassword(String? value, String? other) {
    final val = value?.trim();

    if (val == null || val.isEmpty) {
      return context.l10n.signUpPasswordCannotBeEmpty;
    }

    if (val.contains(' ')) {
      return context.l10n.signUpPasswordCannotIncludeWhitespaces;
    }

    if (val.length < 8) {
      return context.l10n.signUpPasswordMustBeAtLeastCharacters;
    }

    if (val != other) {
      return context.l10n.signUpPasswordsMustBeEqual;
    }

    return null;
  }

  void _handlePasswordClearPressed() {
    if (!_isPasswordFormValid) {
      _passwordFormKey.currentState?.reset();
      _passwordController.clear();
      _confirmController.clear();
      setState(() {
        _isPasswordFormValid = true;
      });
    } else {
      setState(() {
        _isPasswordsHidden = !_isPasswordsHidden;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authenticationControllerProvider);

    ref.listen(authenticationControllerProvider, (previous, next) {
      next
        ..showSnackbarOnError(context)
        ..whenData(
          (state) => state.whenOrNull(
            ageCheckRequired: () => context.replaceRoute(state.route),
          ),
        );
    });

    return Unfocus(
      child: LoadingOverlay(
        isLoading: state.isLoading,
        child: Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.signUpCreateAccount),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: ltPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: ltPadding),
                    child: Text(
                      context.l10n.signUpEnterEmail,
                      style: Theme.of(context).customTheme.tHeading6Regular,
                    ),
                  ),
                  Form(
                    key: _emailFormKey,
                    child: TextFormField(
                      validator: (value) => isEmail(value ?? '')
                          ? null
                          : context.l10n.signUpEnterValidEmail,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: context.l10n.signUpEmailAddress,
                        suffixIcon: IconButton(
                          tooltip: context.l10n.signUpClearEmail,
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _emailFormKey.currentState?.reset();
                            _emailController.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: ltPadding * 2,
                  ),
                  Text(
                    context.l10n.signUpChoosePassword,
                    style: Theme.of(context).customTheme.tHeading6Regular,
                  ),
                  Gaps.vGapPadding,
                  Form(
                    key: _passwordFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            return _validatePassword(
                              value,
                              _confirmController.text,
                            );
                          },
                          controller: _passwordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              tooltip: _isPasswordFormValid
                                  ? (_isPasswordsHidden
                                      ? context.l10n.signUpShowPasswords
                                      : context.l10n.signUpHidePasswords)
                                  : context.l10n.signUpClearPassword,
                              icon: Icon(
                                _isPasswordFormValid
                                    ? (_isPasswordsHidden
                                        ? Icons.visibility_off
                                        : Icons.visibility)
                                    : Icons.clear,
                              ),
                              onPressed: _handlePasswordClearPressed,
                            ),
                            hintText: context.l10n.logInPassword,
                          ),
                          obscureText: _isPasswordsHidden,
                          obscuringCharacter: '*',
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _confirmController,
                          validator: (value) {
                            if (value != _passwordController.text) {
                              return context.l10n.signUpPasswordsMustBeEqual;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordFormValid
                                    ? (_isPasswordsHidden
                                        ? Icons.visibility_off
                                        : Icons.visibility)
                                    : Icons.clear,
                              ),
                              onPressed: _handlePasswordClearPressed,
                            ),
                            hintText: context.l10n.signUpConfirmPassword,
                          ),
                          obscureText: _isPasswordsHidden,
                          obscuringCharacter: '*',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: ltPadding),
                    child: FilledButton(
                      onPressed: () async {
                        final isEmailValid =
                            _emailFormKey.currentState?.validate() ?? false;
                        final isPasswordsValid =
                            _passwordFormKey.currentState?.validate() ?? false;

                        if (!isPasswordsValid) {
                          setState(() {
                            _isPasswordFormValid = false;
                          });
                        }

                        if (isEmailValid && isPasswordsValid) {
                          await ref
                              .read(authenticationControllerProvider.notifier)
                              .signUpWithPassword(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                        }
                      },
                      child: Text(context.l10n.commonSubmit),
                    ),
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
