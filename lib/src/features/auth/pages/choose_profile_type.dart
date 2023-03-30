import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/auth/auth.dart';
import 'package:u16/src/l10n/l10n.dart';

@RoutePage()
class ChooseProfileTypePage extends ConsumerStatefulWidget {
  const ChooseProfileTypePage({
    this.dateOfBirth,
    super.key,
  });
  final DateTime? dateOfBirth;

  @override
  ConsumerState<ChooseProfileTypePage> createState() =>
      _ChooseProfileTypePageState();
}

class _ChooseProfileTypePageState extends ConsumerState<ChooseProfileTypePage> {
  UserProfileType? _selected;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authenticationControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.chooseProfileTypeAppBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ltPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ProfileTypeItem(
                          type: UserProfileType.junior,
                          onSelect: () {
                            setState(() {
                              _selected = UserProfileType.junior;
                            });
                          },
                          isSelected: _selected == UserProfileType.junior,
                        ),
                      ),
                      Expanded(
                        child: ProfileTypeItem(
                          type: UserProfileType.coach,
                          onSelect: () {
                            setState(() {
                              _selected = UserProfileType.coach;
                            });
                          },
                          isSelected: _selected == UserProfileType.coach,
                        ),
                      ),
                    ],
                  ),
                  Gaps.vGap10,
                  Row(
                    children: [
                      Expanded(
                        child: ProfileTypeItem(
                          type: UserProfileType.scout,
                          onSelect: () {
                            setState(() {
                              _selected = UserProfileType.scout;
                            });
                          },
                          isSelected: _selected == UserProfileType.scout,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: ltPadding * 2,
                  ),
                  FilledButton(
                    onPressed: _selected != null
                        ? () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (context) => CreateUsernamePage(
                                  dateOfBirth: widget.dateOfBirth,
                                  profileType: _selected!,
                                ),
                              ),
                            );
                          }
                        : null,
                    child: Text(context.l10n.commonNext),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SafeArea(
                  child: TextButton(
                    onPressed: authState.isLoading
                        ? null
                        : () => ref
                            .read(authenticationControllerProvider.notifier)
                            .signOut(),
                    child: Text(context.l10n.authLogOut),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProfileTypeItem extends StatelessWidget {
  const ProfileTypeItem({
    required this.type,
    required this.onSelect,
    this.isSelected = false,
    super.key,
  });
  final UserProfileType type;
  final bool isSelected;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).customTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () async => onSelect.call(),
      child: Column(
        children: [
          SvgPicture.asset(type.assetName),
          Gaps.vGap10,
          Text(
            type.title(context),
            style: theme.tHeading6?.copyWith(
              color:
                  isSelected ? colorScheme.primary : colorScheme.onBackground,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
