import 'package:base/presentation/pages/widgets/input/input_type_alphanumeric.dart';
import 'package:base/presentation/pages/widgets/input/input_type_datetime.dart';
import 'package:base/presentation/pages/widgets/input/input_type_dropdown.dart';
import 'package:base/presentation/utils/input/valid.dart';
import 'package:base/presentation/pages/widgets/primary_button.dart';
import 'package:base/presentation/utils/theme/color_themes.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RequestForm extends StatefulWidget {
  const RequestForm({super.key});

  @override
  State<RequestForm> createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm>
    with RequestInputValidationMixin {
  bool enable = false;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _tecnController = TextEditingController();
  final _timeController = TextEditingController();

  final items = <String>[
    'Tecnologia 1',
    'Tecnologia 2',
    'Tecnologia 3',
    'Tecnologia 4',
    'Tecnologia 5',
  ];

  @override
  void setState(VoidCallback fn) {
    enable = validate();
    super.setState(fn);
  }

  void onChanged() {
    setState(() {});
  }

  bool validate() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        return true;
      }
      return false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          InputTypeAlphanumeric(
            controller: _nameController,
            keyboardType: TextInputType.text,
            labelText: 'Requerimiento',
            hintText: 'Diseño vista login',
            isValid: isNameValid,
            iconData: MdiIcons.noteEditOutline,
            onChanged: onChanged,
            action: TextInputAction.next,
          ),
          SizedBox(
            height: size.height * 0.016,
          ),
          InputTypeDateTime(
            controller: _dateController,
            label: 'Fecha',
            hint: '00/00/0000',
            isValid: isDateValid,
            onChanged: onChanged,
            icon: MdiIcons.calendar,
            pickerMode: DateTimeFieldPickerMode.dateAndTime,
          ),
          SizedBox(
            height: size.height * 0.016,
          ),
          InputTypeDropdown(
            controller: _tecnController,
            items: items,
            icon: MdiIcons.memory,
            label: 'Tecnologias',
            hint: 'Tecnologia 1',
            onChanged: onChanged,
            isValid: isTechnologyValid,
          ),
          SizedBox(
            height: size.height * 0.016,
          ),
          InputTypeAlphanumeric(
            controller: _timeController,
            keyboardType: TextInputType.number,
            labelText: 'Horas',
            hintText: '8',
            isValid: isTimeValid,
            iconData: MdiIcons.clockOutline,
            onChanged: onChanged,
            action: TextInputAction.done,
          ),
          SizedBox(height: size.height * 0.026),
          PrimaryButton(
            enable: enable,
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
              if (_formKey.currentState!.validate()) {}
            },
            title: 'Enviar',
            backgroundColor: ColorThemes.backgroundDark,
          ),
        ],
      ),
    );
  }
}
