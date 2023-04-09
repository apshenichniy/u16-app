import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/gen/assets.gen.dart';
import 'package:u16/src/l10n/l10n.dart';

class TeamTabView extends StatelessWidget {
  const TeamTabView({super.key});

  @override
  Widget build(BuildContext context) {
    const daysStreak = 51;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(right: ltPadding),
        child: Container(
          color: Colors.red.shade100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              SvgPicture.asset(
                Assets.images.daysStreak,
                //fit: BoxFit.scaleDown,
                //height: 40,
              ),
              // Baseline(
              //   baseline: 40 * 1.115,
              //   baselineType: TextBaseline.alphabetic,
              //   child: SvgPicture.asset(
              //     Assets.images.daysStreak,
              //     //height: 40,
              //   ),
              // ),
              // Container(
              //   height: 40,
              //   width: 40,
              //   color: Colors.green,
              // ),
              // Gaps.hGap8,
              Text(
                '$daysStreak ${context.l10n.commonDays}',
                style: TextStyle(
                  fontSize: 40,
                  backgroundColor: Colors.green.shade100,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                '$daysStreak ${context.l10n.commonDays}',
                style: TextStyle(
                  fontSize: 40,
                  backgroundColor: Colors.green.shade100,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
