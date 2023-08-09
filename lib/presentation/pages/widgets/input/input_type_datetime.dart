import 'package:base/presentation/utils/input/input.dart';
import 'package:base/presentation/utils/theme/color_themes.dart';
import 'package:base/presentation/utils/theme/font_themes.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class InputTypeDateTime extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final Function isValid;
  final Function onChanged;
  final DateTimeFieldPickerMode pickerMode;

  const InputTypeDateTime({
    super.key,
    required this.controller,
    required this.isValid,
    required this.pickerMode,
    required this.label,
    required this.hint,
    required this.icon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DateTimeFormField(
      initialValue: DateTime.now(),
      dateTextStyle: FontThemes.valueInput,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        labelText: label,
        labelStyle: FontThemes.label,
        hintText: hint,
        hintStyle: FontThemes.hint,
        errorStyle: FontThemes.hintError,
        border: InputConfig.inputBorder,
        focusedBorder: InputConfig.inputBorderFocus,
        enabledBorder: InputConfig.inputBorder,
        errorBorder: InputConfig.inputErrorBorder,
        focusedErrorBorder: InputConfig.inputErrorBorder,
        prefixIcon: Icon(
          icon,
          size: 25,
          color: ColorThemes.primarydDark,
        ),
      ),
      mode: pickerMode,
      autovalidateMode: AutovalidateMode.always,
      validator: (value) => isValid(value),
      onDateSelected: (DateTime value) {
        onChanged();
        controller.text = value.toString();
      },
    );
  }
}
