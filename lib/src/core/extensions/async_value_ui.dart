import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:u16/src/core/core.dart';

extension AsyncVaueUI on AsyncValue<dynamic> {
  void showSnackbarOnError(BuildContext context) {
    if (this is AsyncError) {
      context.showErrorSnackbar(error.toString());
    }
  }
}
