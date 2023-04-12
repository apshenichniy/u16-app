// ignore_for_file: public_member_api_docs, sort_constructors_first
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
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  context.l10n.personalDetails,
                ),
                if (widget.isCurrentUser)
                  Baseline(
                    baseline: 40,
                    baselineType: TextBaseline.alphabetic,
                    child: IconButton(
                      onPressed: () {
                        context.router.pushWidget(
                          EditPersonalDetails(
                            user: widget.user,
                          ),
                          transitionBuilder: TransitionsBuilders.slideBottom,
                          transitionDuration: const Duration(milliseconds: 150),
                        );
                      },
                      icon: SvgPicture.asset(
                        Assets.images.editIcon,
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ),
              ],
            ),
            Gaps.vGapPadding,
            // 'date of birth' for current user
            _DetailsItem(
              title: context.l10n.personalDetailsDateOfBirth,
              value: widget.isCurrentUser
                  ? DateFormat.yMMMd().format(widget.user.dateOfBirth)
                  : AgeCalculator.age(widget.user.dateOfBirth).years.toString(),
            ),
            divider1,
            _DetailsItem(
              title: context.l10n.personalDetailsGender,
              value: widget.user.gender?.localized(context),
            ),
            divider1,
            _DetailsItem(
              title: context.l10n.personalDetailsHeight,
              value:
                  widget.user.height != null ? '${widget.user.height} cm' : '',
            ),
            divider1,
            _DetailsItem(
              title: context.l10n.personalDetailsWeight,
              value:
                  widget.user.weight != null ? '${widget.user.weight} kg' : '',
            ),
            divider1,
            FilledButton(
              onPressed: () async {
                await showDiscardChangesDialog(context);
              },
              child: const Text('Show'),
            )
          ],
        ),
      ),
    );
  }
}

class _DetailsItem extends StatelessWidget {
  const _DetailsItem({
    required this.title,
    required this.value,
    // ignore: unused_element
    super.key,
  });
  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.h6Medium,
          ),
          Text(
            value ?? '-',
            style: AppTextStyles.h6Regular,
          ),
        ],
      ),
    );
  }
}
