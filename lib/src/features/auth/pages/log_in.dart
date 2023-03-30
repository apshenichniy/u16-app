import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/core/widgets/unfocus.dart';
import 'package:u16/src/features/auth/auth.dart';
import 'package:u16/src/l10n/l10n.dart';
import 'package:validators/validators.dart';

class LogInPage extends ConsumerStatefulWidget {
  const LogInPage({super.key});
  @override
  ConsumerState<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends ConsumerState<LogInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordHidden = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      await ref
          .read(authenticationControllerProvider.notifier)
          .signInWithPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authenticationControllerProvider, (previous, next) {
      next
        ..showSnackbarOnError(context)
        ..whenData(
          (state) => context.replaceRoute(state.route),
        );
    });

    final isLoading = ref.watch(authenticationControllerProvider).isLoading;

    return LoadingOverlay(
      isLoading: isLoading,
      child: Unfocus(
        child: Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.signInLogIn),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: ltPadding),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    context.l10n.logInEnterEmailAndPassword,
                    style: Theme.of(context).customTheme.tHeading6Regular,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: ltPadding,
                  ),
                  TextFormField(
                    validator: (value) => isEmail(value ?? '')
                        ? null
                        : context.l10n.signUpEnterValidEmail,
                    autofocus: true,
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: context.l10n.logInEmail,
                      suffixIcon: IconButton(
                        onPressed: _emailController.clear,
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: ltPadding,
                  ),
                  TextFormField(
                    validator: (value) =>
                        value != null && value.trim().isNotEmpty
                            ? null
                            : context.l10n.logInPasswordIsEmpty,
                    controller: _passwordController,
                    obscureText: _passwordHidden,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      hintText: context.l10n.logInPassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordHidden = !_passwordHidden;
                          });
                        },
                        icon: Icon(
                          _passwordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: ltPadding,
                  ),
                  FilledButton(
                    onPressed: _handleSubmit,
                    child: Text(context.l10n.signInLogIn),
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
