import 'package:base/presentation/utils/theme/color_themes.dart';
import 'package:flutter/material.dart';

class FontThemes {
  static TextStyle get title => const TextStyle(
        fontSize: 32,
        height: 1.5,
        fontWeight: FontWeight.w600,
        color: ColorThemes.backgroundDarkContrast,
      );

  static TextStyle get note => const TextStyle(
        fontSize: 14,
        height: 1.5,
        fontWeight: FontWeight.w400,
        color: ColorThemes.backgroundDarkContrast,
      );

  static TextStyle get valueInput => const TextStyle(
        fontSize: 16,
        height: 1.5,
        fontWeight: FontWeight.w400,
        color: ColorThemes.accentDark,
      );

  static TextStyle get label => const TextStyle(
        fontSize: 16,
        height: 1.25,
        fontWeight: FontWeight.w400,
        color: ColorThemes.backgroundDarkContrast,
      );

  static TextStyle get hint => const TextStyle(
        fontSize: 16,
        height: 1.25,
        fontWeight: FontWeight.w400,
        color: ColorThemes.primarydDark,
      );

  static TextStyle get hintError => const TextStyle(
        fontSize: 12,
        height: 1.25,
        fontWeight: FontWeight.w400,
        color: ColorThemes.errorDark,
      );

  static TextStyle get buttonEnable => const TextStyle(
        fontSize: 20,
        height: 1.25,
        fontWeight: FontWeight.w500,
        color: ColorThemes.backgroundLight,
      );

  static TextStyle get buttonDisable => const TextStyle(
        fontSize: 20,
        height: 1.25,
        fontWeight: FontWeight.w500,
        color: ColorThemes.accentLight,
      );
}
