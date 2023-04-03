import 'package:flutter/material.dart';
import 'package:u16/src/features/auth/auth.dart';
import 'package:u16/src/l10n/l10n.dart';

extension GenderTypeUi on GenderType {
  String localized(BuildContext context) {
    switch (this) {
      case GenderType.male:
        return context.l10n.commonMale;
      case GenderType.female:
        return context.l10n.commonFemale;
    }
  }
}
