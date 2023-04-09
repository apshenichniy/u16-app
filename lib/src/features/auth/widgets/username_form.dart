import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/auth/auth.dart';
import 'package:u16/src/l10n/l10n.dart';

class UsernameForm extends ConsumerStatefulWidget {
  const UsernameForm({this.initialValue = '', super.key});
  final String initialValue;

  @override
  ConsumerState<UsernameForm> createState() => _UsernameFormState();
}

class _UsernameFormState extends ConsumerState<UsernameForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Widget? _buildSuffix(AsyncValue<UsernameAvailabilityState> state) {
    final scheme = Theme.of(context).colorScheme;

    if (state.isLoading) {
      return const CupertinoActivityIndicator();
    } else if (state.hasValue) {
      return state.requireValue.when(
        initial: () => IconButton(
          icon: const Icon(Icons.clear),
          onPressed: _textController.clear,
        ),
        available: (value) => _validate(value) == null
            ? Icon(
                Icons.check_circle,
                color: scheme.primary,
              )
            : IconButton(
                icon: Icon(
                  Icons.clear,
                  color: scheme.error,
                ),
                onPressed: _textController.clear,
              ),
        alreadyRegistered: () => IconButton(
          icon: Icon(
            Icons.clear,
            color: scheme.error,
          ),
          onPressed: _textController.clear,
        ),
      );
    }
    return null;
  }

  String? _validate(String? value) {
    if (value == null || value.length < 4) {
      return context.l10n.createUsernameTooShort;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final state = ref.watch(usernameAvailabilityControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.l10n.createUsernameChooseUsername,
          //style: theme.customTheme.tHeading6,
        ),
        Gaps.vGap10,
        Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: TextFormField(
            controller: _textController,
            validator: _validate,
            onChanged: (value) {
              if (_validate(value) == null) {
                EasyDebounce.debounce(
                    'username-debounce', const Duration(milliseconds: 500), () {
                  ref
                      .read(usernameAvailabilityControllerProvider.notifier)
                      .checkUsername(value);
                });
              }
            },
            decoration: InputDecoration(
              hintText: context.l10n.createUsernameUsername,
              suffixIcon: _buildSuffix(state),
              //helperStyle: theme.customTheme.tHeading6,
              errorText: state.valueOrNull?.whenOrNull(
                alreadyRegistered: () =>
                    context.l10n.createUsernameIsNotAvailable,
              ),
              helperText: state.valueOrNull?.whenOrNull(
                available: (_) =>
                    context.l10n.createUsernameUsernameIsAvailable,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
