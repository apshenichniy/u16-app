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
              children: [
                Text(
                  context.l10n.personalDetails,
                  style: Theme.of(context).customTheme.tHeading4,
                ),
                if (widget.isCurrentUser)
                  IconButton(
                    onPressed: () {
                      context.router.pushWidget(
                        EditPersonalDetails(
                          user: widget.user,
                        ),
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
              PropertyTile(
                title: context.l10n.personalDetailsDateOfBirth,
                value: DateFormat.yMMMd().format(widget.user.dateOfBirth),
              )
            else
              // 'age' for other user
              PropertyTile(
                title: context.l10n.personalDetailsAge,
                value:
                    AgeCalculator.age(widget.user.dateOfBirth).years.toString(),
              ),
            divider1,
            PropertyTile(
              title: context.l10n.personalDetailsGender,
              value: widget.user.gender?.localized(context),
            ),
            divider1,
            PropertyTile(
              title: context.l10n.personalDetailsHeight,
              value:
                  widget.user.height != null ? '${widget.user.height} cm' : '',
            ),
            divider1,
            PropertyTile(
              title: context.l10n.personalDetailsWeight,
              value:
                  widget.user.weight != null ? '${widget.user.weight} kg' : '',
            ),
            divider1,
            PropertyTile(title: context.l10n.personalDetailsStrongSides),
            divider1,
            PropertyTile(title: context.l10n.personalDetailsCountry),
            divider1,
            PropertyTile(title: context.l10n.personalDetailsSchool),
            divider1,
            PropertyTile(title: context.l10n.personalDetailsLanguage),
            divider1,
          ],
        ),
      ),
    );
  }
}
