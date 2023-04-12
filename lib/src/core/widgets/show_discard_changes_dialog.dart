import 'package:flutter/material.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/l10n/l10n.dart';

Future<bool?> showDiscardChangesDialog(BuildContext context) {
  final backgroundColor = Theme.of(context).colorScheme.background;

  return showDialog<bool?>(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: backgroundColor,
        surfaceTintColor: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(ltPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.l10n.discardChanges,
                style: AppTextStyles.h6Inter,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: ltPadding / 2),
                child: Text(
                  context.l10n.discardChangesIfYouGoBack,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h7,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: FilledButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  style: FilledButton.styleFrom(
                    textStyle: AppTextStyles.h7Inter,
                  ),
                  child: Text(context.l10n.discardChanges),
                ),
              ),
              FilledButton(
                onPressed: () => Navigator.of(context).pop(false),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.lightGray,
                  foregroundColor: AppColors.black,
                  textStyle: AppTextStyles.h7Inter,
                ),
                child: Text(context.l10n.discardChangesContinueEditing),
              ),
            ],
          ),
        ),
      );
    },
  );
}
