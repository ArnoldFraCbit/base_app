import 'package:base/presentation/utils/input/input.dart';
import 'package:base/presentation/utils/theme/color_themes.dart';
import 'package:base/presentation/utils/theme/font_themes.dart';
import 'package:flutter/material.dart';

class InputTypeAlphanumeric extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String labelText;
  final String hintText;
  final Function isValid;
  final IconData iconData;
  final Function onChanged;
  final TextInputAction action;

  const InputTypeAlphanumeric({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.isValid,
    required this.iconData,
    required this.onChanged,
    required this.action,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: FontThemes.valueInput,
      keyboardType: keyboardType,
      cursorColor: ColorThemes.backgroundDark,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: action,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        labelText: labelText,
        labelStyle: FontThemes.label,
        hintText: hintText,
        hintStyle: FontThemes.hint,
        filled: false,
        border: InputConfig.inputBorder,
        focusedBorder: InputConfig.inputBorderFocus,
        enabledBorder: InputConfig.inputBorder,
        errorBorder: InputConfig.inputErrorBorder,
        focusedErrorBorder: InputConfig.inputErrorBorder,
        errorStyle: FontThemes.hintError,
        prefixIcon: Icon(
          iconData,
          size: 25,
          color: ColorThemes.primarydDark,
        ),
      ),
      onChanged: (value) => onChanged(),
      validator: (value) => isValid(value),
    );
  }
}
