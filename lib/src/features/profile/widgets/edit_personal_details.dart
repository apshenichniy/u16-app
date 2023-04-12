import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/auth/models/app_user.dart';
import 'package:u16/src/features/profile/widgets/widgets.dart';
import 'package:u16/src/l10n/l10n.dart';
import 'package:validators/validators.dart';

class EditPersonalDetails extends StatefulWidget {
  const EditPersonalDetails({required this.user, super.key});
  final AppUser user;

  @override
  State<EditPersonalDetails> createState() => _EditPersonalDetailsState();
}

class _EditPersonalDetailsState extends State<EditPersonalDetails> {
  late AppUser _editedUser;

  @override
  void initState() {
    super.initState();
    _editedUser = widget.user;
  }

  Future<void> _handleCancel() async {
    if (_editedUser != widget.user) {
      final isDiscardChanges = await showDiscardChangesDialog(context) ?? false;
      if (isDiscardChanges && context.mounted) {
        await context.popRoute();
      }
    } else {
      await context.popRoute();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: _handleCancel,
              style: TextButton.styleFrom(foregroundColor: AppColors.black),
              child: Text(context.l10n.commonCancel),
            ),
            TextButton(
              onPressed: () {},
              child: Text(context.l10n.commonSave),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: ltPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Avatar(
                imageUrl: 'https://i.pravatar.cc/300',
                showEditButton: true,
              ),
              Gaps.vGapPadding,
              divider1,

              /// Username
              _EditDetailsItem(
                title: context.l10n.createUsernameUsername,
                child: Text(
                  _editedUser.username,
                  style: AppTextStyles.h6Regular,
                ),
                onTap: () async {
                  final username = await Future<String?>.value('new username');
                  _editedUser = _editedUser.copyWith(username: username ?? '');
                },
              ),
              divider1,
              _EditBioItem(
                bio: widget.user.bio,
              ),
              divider1,

              /// Dat of birth
              _EditDetailsItem(
                title: context.l10n.personalDetailsDateOfBirth,
                child: Text(
                  DateFormat.yMMMd().format(_editedUser.dateOfBirth),
                  style: AppTextStyles.h6Regular,
                ),
                onTap: () {},
              ),
              divider1,

              /// Height
              _EditDetailsItem(
                title: context.l10n.personalDetailsHeight,
                child: Text(
                  _editedUser.height != null
                      ? '${_editedUser.height} ${context.l10n.commonCm}'
                      : '${context.l10n.personalDetailsYourHeight} '
                          '(${context.l10n.commonCm})',
                  style: _editedUser.height != null
                      ? AppTextStyles.h6Regular
                      : AppTextStyles.h6Regular.copyWith(color: AppColors.gray),
                ),
                onTap: () async {
                  final result =
                      await context.router.pushWidget<PopResult<int?>?>(
                    EditDetailsProperty<int>(
                      initialValue: _editedUser.height,
                      builder: (context, onChanged) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              context.l10n.personalDetailsEnterYourHeight,
                              style: AppTextStyles.h6Regular,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: ltPadding / 2),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                initialValue: _editedUser.height?.toString(),
                                onChanged: (value) =>
                                    onChanged(int.tryParse(value)),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return null;
                                  }

                                  if (!isInt(value)) {
                                    return context.l10n
                                        .personalDetailsHeightShouldBeANumber;
                                  }
                                  return null;
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  hintText:
                                      context.l10n.personalDetailsYourHeight,
                                  suffixText: context.l10n.commonCm,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                  result?.whenOrNull(
                    data: (value) {
                      setState(() {
                        _editedUser = _editedUser.copyWith(height: value);
                      });
                    },
                  );
                },
              ),
              divider1,
              _EditDetailsItem(
                title: context.l10n.personalDetailsWeight,
                child: Text(
                  _editedUser.weight != null
                      ? '${_editedUser.weight} ${context.l10n.commonKg}'
                      : '${context.l10n.personalDetailsYourWeight} '
                          '(${context.l10n.commonKg})',
                  style: _editedUser.weight != null
                      ? AppTextStyles.h6Regular
                      : AppTextStyles.h6Regular.copyWith(color: AppColors.gray),
                ),
                onTap: () {},
              ),
              divider1,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: ltPadding * 2),
                child: FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.delete_forever),
                  label: Text(context.l10n.personalDetailsDeleteAccount),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EditDetailsItem extends StatelessWidget {
  // ignore: unused_element
  const _EditDetailsItem({
    required this.title,
    this.onTap,
    this.child,
    // ignore: unused_element
    super.key,
  });
  final String title;
  final Widget? child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.h6Medium,
            ),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}

class _EditBioItem extends StatelessWidget {
  // ignore: unused_element
  const _EditBioItem({this.bio, this.onTap, super.key});
  final String? bio;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              context.l10n.personalDetailsBio,
              style: AppTextStyles.h6Medium,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              bio ?? context.l10n.personalDetailsYourBio,
              style: bio != null
                  ? AppTextStyles.h6Regular
                  : AppTextStyles.h6Regular.copyWith(
                      color: AppColors.gray,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
