import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/auth/auth.dart';
import 'package:u16/src/l10n/l10n.dart';

class CreateUsernamePage extends ConsumerStatefulWidget {
  const CreateUsernamePage({
    required this.profileType,
    this.dateOfBirth,
    super.key,
  });
  final DateTime? dateOfBirth;
  final UserProfileType profileType;

  @override
  ConsumerState<CreateUsernamePage> createState() => _CreateUsernamePageState();
}

class _CreateUsernamePageState extends ConsumerState<CreateUsernamePage> {
  final _controller = TextEditingController();
  String? _errorText;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context).customTheme;
    final isLoading = ref.watch(createUsernameNotifierProvider).isLoading ||
        ref.watch(authenticationControllerProvider).isLoading;

    ref
      ..listen(createUsernameNotifierProvider, (previous, next) {
        next
          ..showSnackbarOnError(context)
          ..whenData((state) {
            if (state == CreateUsernameState.usernameAlreadyRegistered) {
              setState(() {
                _errorText = context.l10n.createUsernameIsNotAvailable;
              });
            }
          });
      })
      ..listen(authenticationControllerProvider, (_, next) {
        next.whenData(
          (state) => state.whenOrNull(
            authenticated: (_) => context.replaceRoute(const HomeRouter()),
          ),
        );
      });

    return LoadingOverlay(
      isLoading: isLoading,
      child: Unfocus(
        child: Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.createUsernameAppBarTitle),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: ltPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: ltPadding,
                ),
                Text(
                  context.l10n.createUsernameChooseUsername,
                  //style: theme.tHeading6,
                ),
                Gaps.vGap10,
                TextField(
                  controller: _controller,
                  onChanged: (_) {
                    if (_errorText != null) {
                      setState(() {
                        _errorText = null;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    hintText: context.l10n.createUsernameUsername,
                    errorText: _errorText,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _controller.clear();
                        setState(() {
                          _errorText = null;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: ltPadding),
                  child: FilledButton(
                    onPressed: () async {
                      if (_controller.text.trim().isEmpty) {
                        setState(() {
                          _errorText = context.l10n.createUsernameIsEmpty;
                        });
                      } else {
                        await ref
                            .read(createUsernameNotifierProvider.notifier)
                            .createUserProfile(
                              username: _controller.text.trim(),
                              dateOfBirth: widget.dateOfBirth,
                              profileType: widget.profileType,
                            );
                      }
                    },
                    child: Text(context.l10n.commonNext),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
