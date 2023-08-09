import 'package:base/presentation/utils/theme/color_themes.dart';
import 'package:flutter/material.dart';

class InputConfig {
  static InputBorder get inputBorder => const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color: ColorThemes.primarydLight,
          width: 1,
        ),
      );

  static InputBorder get inputBorderFocus => const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color: ColorThemes.backgroundDark,
          width: 1,
        ),
      );

  static InputBorder get inputErrorBorder => const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color: ColorThemes.errorDark,
          width: 1,
        ),
      );
}
