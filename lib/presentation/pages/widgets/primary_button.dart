import 'package:base/presentation/utils/theme/color_themes.dart';
import 'package:base/presentation/utils/theme/font_themes.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final bool enable;
  final VoidCallback onPressed;
  final String title;
  final Color backgroundColor;

  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.backgroundColor,
    required this.enable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: enable ? onPressed : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      disabledColor: ColorThemes.secondaryDark,
      disabledTextColor: ColorThemes.accentLight,
      color: backgroundColor,
      splashColor: ColorThemes.backgroundLight,
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      child: Center(
        child: Text(
          title,
          style: enable ? FontThemes.buttonEnable : FontThemes.buttonDisable,
        ),
      ),
    );
  }
}
