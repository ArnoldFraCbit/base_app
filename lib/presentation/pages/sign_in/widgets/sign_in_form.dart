import 'package:base/domain/entities/user.dart';
import 'package:base/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:base/presentation/pages/widgets/input/input_type_alphanumeric.dart';
import 'package:base/presentation/pages/widgets/input/input_type_password.dart';
import 'package:base/presentation/utils/input/valid.dart';
import 'package:base/presentation/pages/widgets/primary_button.dart';
import 'package:base/presentation/utils/theme/color_themes.dart';
import 'package:base/presentation/utils/theme/font_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm>
    with SignInInputValidationMixin {
  bool enable = false;
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passController = TextEditingController();

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
            controller: _userController,
            keyboardType: TextInputType.text,
            labelText: 'Email',
            hintText: 'example@cbit-online.com',
            isValid: isUserValid,
            iconData: MdiIcons.accountOutline,
            onChanged: onChanged,
            action: TextInputAction.next,
          ),
          SizedBox(
            height: size.height * 0.016,
          ),
          InputTypePassword(
            controller: _passController,
            labelText: 'Contraseña',
            hintText: '*********',
            isValid: isPassValid,
            onChanged: onChanged,
            action: TextInputAction.done,
          ),
          SizedBox(height: size.height * 0.008),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(8),
            child: Text(
              '¿Olvidaste tu contraeña?',
              style: FontThemes.note,
            ),
          ),
          SizedBox(height: size.height * 0.026),
          PrimaryButton(
            enable: enable,
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
              BlocProvider.of<SignInBloc>(context).add(
                SignInSubmitted(
                  resquest: User(user: 'user', pass: 'pass'),
                ),
              );
            },
            title: 'Iniciar seccion',
            backgroundColor: ColorThemes.backgroundDark,
          ),
        ],
      ),
    );
  }
}
