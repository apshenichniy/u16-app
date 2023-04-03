import 'package:age_calculator/age_calculator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/auth/models/app_user.dart';
import 'package:u16/src/features/profile/profile.dart';
import 'package:u16/src/gen/assets.gen.dart';
import 'package:u16/src/l10n/l10n.dart';

class PersonalDetailsTabView extends StatefulWidget {
  const PersonalDetailsTabView({
    required this.user,
    required this.isCurrentUser,
    super.key,
  });
  final AppUser user;
  final bool isCurrentUser;

  @override
  State<PersonalDetailsTabView> createState() => _PersonalDetailsTabViewState();
}

class _PersonalDetailsTabViewState extends State<PersonalDetailsTabView> {
  Widget _buildPropertyRow({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .customTheme
                .tHeading6
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            value,
            style: Theme.of(context).customTheme.tHeading6,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(ltPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.personalDetails,
                  style: Theme.of(context).customTheme.tHeading4,
                ),
                if (widget.isCurrentUser)
                  IconButton(
                    onPressed: () {
                      context.router.pushWidget(
                        const EditPersonalDetails(),
                        transitionBuilder: TransitionsBuilders.slideBottom,
                        transitionDuration: const Duration(milliseconds: 150),
                      );
                    },
                    icon: SvgPicture.asset(Assets.images.editIcon),
                  ),
              ],
            ),
            Gaps.vGapPadding,
            // 'date of birth' for current user
            if (widget.isCurrentUser)
              _buildPropertyRow(
                title: context.l10n.personalDetailsDateOfBirth,
                value: DateFormat.yMMMd().format(widget.user.dateOfBirth),
              )
            else
              // 'age' for other user
              _buildPropertyRow(
                title: context.l10n.personalDetailsAge,
                value:
                    AgeCalculator.age(widget.user.dateOfBirth).years.toString(),
              ),
            const Divider(),
            _buildPropertyRow(
              title: context.l10n.personalDetailsGender,
              value: widget.user.gender?.localized(context) ?? '-',
            ),
            const Divider(),
            _buildPropertyRow(
              title: context.l10n.personalDetailsHeight,
              value: widget.user.height?.toString() ?? '-',
            ),
            const Divider(),
            _buildPropertyRow(
              title: context.l10n.personalDetailsWeight,
              value: widget.user.gender?.localized(context) ?? '-',
            ),
            const Divider(),
            _buildPropertyRow(
              title: context.l10n.personalDetailsStrongSides,
              value: '-',
            ),
            const Divider(),
            _buildPropertyRow(
              title: context.l10n.personalDetailsCountry,
              value: '-',
            ),
            const Divider(),
            _buildPropertyRow(
              title: context.l10n.personalDetailsSchool,
              value: '-',
            ),
            const Divider(),
            _buildPropertyRow(
              title: context.l10n.personalDetailsLanguage,
              value: '-',
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
