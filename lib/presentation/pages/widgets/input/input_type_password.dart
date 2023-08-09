import 'package:base/presentation/utils/input/input.dart';
import 'package:base/presentation/utils/theme/color_themes.dart';
import 'package:base/presentation/utils/theme/font_themes.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class InputTypePassword extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Function isValid;
  final Function onChanged;
  final TextInputAction action;

  const InputTypePassword({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.isValid,
    required this.onChanged,
    required this.action,
    required this.labelText,
  }) : super(key: key);

  @override
  State<InputTypePassword> createState() => _InputTypePasswordState();
}

class _InputTypePasswordState extends State<InputTypePassword> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: FontThemes.valueInput,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isVisible,
      cursorColor: Theme.of(context).primaryColor,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: widget.action,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        labelText: widget.labelText,
        labelStyle: FontThemes.label,
        hintText: widget.hintText,
        hintStyle: FontThemes.hint,
        filled: false,
        border: InputConfig.inputBorder,
        focusedBorder: InputConfig.inputBorderFocus,
        enabledBorder: InputConfig.inputBorder,
        errorBorder: InputConfig.inputErrorBorder,
        focusedErrorBorder: InputConfig.inputErrorBorder,
        errorStyle: FontThemes.hintError,
        prefixIcon: const Icon(
          MdiIcons.lockOutline,
          size: 25,
          color: ColorThemes.primarydDark,
        ),
        suffixIcon: IconButton(
          splashRadius: 25,
          onPressed: onPressed,
          icon: Icon(
            _isVisible ? MdiIcons.eyeOutline : MdiIcons.eyeOffOutline,
            size: 26,
            color: ColorThemes.primarydDark,
          ),
        ),
      ),
      onChanged: (value) => widget.onChanged(),
      validator: (value) => widget.isValid(value),
    );
  }

  void onPressed() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
}
