import 'package:base/presentation/utils/input/input.dart';
import 'package:base/presentation/utils/theme/color_themes.dart';
import 'package:base/presentation/utils/theme/font_themes.dart';
import 'package:flutter/material.dart';

class InputTypeDropdown extends StatelessWidget {
  final TextEditingController controller;
  final List<String> items;
  final String label;
  final IconData icon;
  final String hint;
  final Function isValid;
  final Function onChanged;

  const InputTypeDropdown({
    super.key,
    required this.controller,
    required this.items,
    required this.label,
    required this.hint,
    required this.isValid,
    required this.onChanged,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      onChanged: (value) {
        onChanged();
        controller.text = value.toString();
      },
      validator: (value) => isValid(value.toString()),
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
          iconColor: ColorThemes.primarydDark,
          prefixIcon: Icon(
            icon,
            size: 25,
            color: ColorThemes.primarydDark,
          )),
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
