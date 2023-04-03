import 'package:flutter/material.dart';

@immutable
class CustomTheme extends ThemeExtension<CustomTheme> {
  const CustomTheme({
    this.textFieldStyle = const TextStyle(
      //fontFamily: 'RedHatDisplay',
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    this.tHeading1 = const TextStyle(
      //fontFamily: 'RedHatDisplay',
      fontSize: 32,
      fontWeight: FontWeight.w600,
    ),
    this.tHeading2 = const TextStyle(
      //fontFamily: 'Inter',
      fontSize: 26,
      fontWeight: FontWeight.w600,
    ),
    this.tHeading3 = const TextStyle(
      //fontFamily: 'Inter',
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    this.tHeading4 = const TextStyle(
      fontFamily: 'Inter',
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    this.tHeading4Regular = const TextStyle(
      //fontFamily: 'RedHatDisplay',
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
    this.tHeading5 = const TextStyle(
      //fontFamily: 'RedHatDisplay',
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    this.tHeading5Regular = const TextStyle(
      //fontFamily: 'RedHatDisplay',
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    this.tHeading5Inter = const TextStyle(
      //fontFamily: 'Inter',
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    this.tHeading5Bold = const TextStyle(
      //fontFamily: 'RedHatDisplay',
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
    this.tHeading6Inter = const TextStyle(
      //fontFamily: 'Inter',
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    this.tHeading6 = const TextStyle(
      // fontFamily: 'RedHatDisplay',
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    this.tHeading6Regular = const TextStyle(
      // fontFamily: 'RedHatDisplay',
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    this.tHeading7 = const TextStyle(
      //fontFamily: 'RedHatDisplay',
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    this.tHeading7Medium = const TextStyle(
      //fontFamily: 'RedHatDisplay',
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    this.tHeading8 = const TextStyle(
      //fontFamily: 'RedHatDisplay',
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    this.tHeading8Bold = const TextStyle(
      //fontFamily: 'RedHatDisplay',
      fontSize: 12,
      fontWeight: FontWeight.w800,
    ),
    this.tHeading9 = const TextStyle(
      //fontFamily: 'RedHatDisplay',
      fontSize: 10,
      fontWeight: FontWeight.w400,
    ),
    this.tHeading9Medium = const TextStyle(
      //fontFamily: 'RedHatDisplay',
      fontSize: 10,
      fontWeight: FontWeight.w500,
    ),
  });
  final TextStyle? textFieldStyle;
  final TextStyle? tHeading1;
  final TextStyle? tHeading2;
  final TextStyle? tHeading3;
  final TextStyle? tHeading4;
  final TextStyle? tHeading4Regular;
  final TextStyle? tHeading5;
  final TextStyle? tHeading5Regular;
  final TextStyle? tHeading5Inter;
  final TextStyle? tHeading5Bold;
  final TextStyle? tHeading6Inter;
  final TextStyle? tHeading6;
  final TextStyle? tHeading6Regular;
  final TextStyle? tHeading7;
  final TextStyle? tHeading7Medium;
  final TextStyle? tHeading8;
  final TextStyle? tHeading8Bold;
  final TextStyle? tHeading9;
  final TextStyle? tHeading9Medium;

  @override
  ThemeExtension<CustomTheme> copyWith({
    TextStyle? textFieldStyle,
    TextStyle? tHeading1,
    TextStyle? tHeading2,
    TextStyle? tHeading3,
    TextStyle? tHeading4,
    TextStyle? tHeading4Regular,
    TextStyle? tHeading5,
    TextStyle? tHeading5Regular,
    TextStyle? tHeading5Inter,
    TextStyle? tHeading5Bold,
    TextStyle? tHeading6Inter,
    TextStyle? tHeading6,
    TextStyle? tHeading6Regular,
    TextStyle? tHeading7,
    TextStyle? tHeading7Medium,
    TextStyle? tHeading8,
    TextStyle? tHeading8Bold,
    TextStyle? tHeading9,
    TextStyle? tHeading9Medium,
  }) {
    return CustomTheme(
      textFieldStyle: textFieldStyle ?? this.textFieldStyle,
      tHeading1: tHeading1 ?? this.tHeading1,
      tHeading2: tHeading2 ?? this.tHeading2,
      tHeading3: tHeading3 ?? this.tHeading3,
      tHeading4: tHeading4 ?? this.tHeading4,
      tHeading4Regular: tHeading4Regular ?? this.tHeading4Regular,
      tHeading5: tHeading5 ?? this.tHeading5,
      tHeading5Regular: tHeading5Regular ?? this.tHeading5Regular,
      tHeading5Inter: tHeading5Inter ?? this.tHeading5Inter,
      tHeading5Bold: tHeading5Bold ?? this.tHeading5Bold,
      tHeading6Inter: tHeading6Inter ?? this.tHeading6Inter,
      tHeading6: tHeading6 ?? this.tHeading6,
      tHeading6Regular: tHeading6Regular ?? this.tHeading6Regular,
      tHeading7: tHeading7 ?? this.tHeading7,
      tHeading7Medium: tHeading7Medium ?? this.tHeading7Medium,
      tHeading8: tHeading8 ?? this.tHeading8,
      tHeading8Bold: tHeading8Bold ?? this.tHeading8Bold,
      tHeading9: tHeading9 ?? this.tHeading9,
      tHeading9Medium: tHeading9Medium ?? this.tHeading9Medium,
    );
  }

  @override
  ThemeExtension<CustomTheme> lerp(
    ThemeExtension<CustomTheme>? other,
    double t,
  ) {
    if (other is! CustomTheme) {
      return this;
    }

    return CustomTheme(
      textFieldStyle: TextStyle.lerp(textFieldStyle, other.textFieldStyle, t),
      tHeading1: TextStyle.lerp(tHeading1, other.tHeading1, t),
      tHeading2: TextStyle.lerp(tHeading2, other.tHeading2, t),
      tHeading3: TextStyle.lerp(tHeading3, other.tHeading3, t),
      tHeading4: TextStyle.lerp(tHeading4, other.tHeading4, t),
      tHeading4Regular:
          TextStyle.lerp(tHeading4Regular, other.tHeading4Regular, t),
      tHeading5: TextStyle.lerp(tHeading5, other.tHeading5, t),
      tHeading5Regular:
          TextStyle.lerp(tHeading5Regular, other.tHeading5Regular, t),
      tHeading5Inter: TextStyle.lerp(tHeading5Inter, other.tHeading5Inter, t),
      tHeading5Bold: TextStyle.lerp(tHeading5Bold, other.tHeading5Bold, t),
      tHeading6Inter: TextStyle.lerp(tHeading6Inter, other.tHeading6Inter, t),
      tHeading6: TextStyle.lerp(tHeading6, other.tHeading6, t),
      tHeading6Regular:
          TextStyle.lerp(tHeading6Regular, other.tHeading6Regular, t),
      tHeading7: TextStyle.lerp(tHeading7, other.tHeading7, t),
      tHeading7Medium:
          TextStyle.lerp(tHeading7Medium, other.tHeading7Medium, t),
      tHeading8: TextStyle.lerp(tHeading8, other.tHeading8, t),
      tHeading8Bold: TextStyle.lerp(tHeading8Bold, other.tHeading8Bold, t),
      tHeading9: TextStyle.lerp(tHeading9, other.tHeading9, t),
      tHeading9Medium:
          TextStyle.lerp(tHeading9Medium, other.tHeading9Medium, t),
    );
  }
}

extension GetCustomTheme on ThemeData {
  CustomTheme get customTheme {
    return extension<CustomTheme>()!;
  }
}
