import 'package:flutter/material.dart';
import 'package:u16/src/gen/fonts.gen.dart';

abstract class AppTextStyles {
  static const h7 = TextStyle(
    fontFamily: FontFamily.redHatDisplay,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const h7Inter = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const h6Inter = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const h6Medium = TextStyle(
    fontFamily: FontFamily.redHatDisplay,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const h6Regular = TextStyle(
    fontFamily: FontFamily.redHatDisplay,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const h5Regular = TextStyle(
    fontFamily: FontFamily.redHatDisplay,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static const h5Medium = TextStyle(
    fontFamily: FontFamily.redHatDisplay,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const h5InterMedium = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
}
