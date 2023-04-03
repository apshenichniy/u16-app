import 'package:flutter/material.dart';
import 'package:u16/src/core/core.dart';

abstract class Gaps {
  static const vGap8 = SizedBox(height: 8);
  static const vGap10 = SizedBox(height: 10);
  static const hGap8 = SizedBox(width: 8);
  static const hGap10 = SizedBox(width: 10);
  static const vGapPadding = SizedBox(
    height: ltPadding,
  );
  static const hGapPadding = SizedBox(
    height: ltPadding,
  );
}

const divider1 = Divider(
  height: 1,
);
