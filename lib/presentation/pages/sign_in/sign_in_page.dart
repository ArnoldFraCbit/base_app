import 'package:base/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:base/presentation/pages/sign_in/widgets/sign_in_form.dart';
import 'package:base/presentation/pages/widgets/dialog/alert_dialog_failure.dart';
import 'package:base/presentation/pages/widgets/dialog/alert_dialog_loading.dart';
import 'package:base/presentation/pages/widgets/scaffold/scaffold_body.dart';
import 'package:base/presentation/utils/theme/font_themes.dart';
import 'package:base/presentation/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<SignInBloc, SignInState>(
      listener: (BuildContext context, SignInState state) {
        if (state is SignInLoading) {
          alertDialogLoading(context: context);
        }

        if (state is SignInSuccess) {
          transitionToRequest();
        }

        if (state is SignInFailure) {
          pop();
          alertDialogFailure(context: context, message: state.message);
          transitionToRequest();
        }
      },
      child: ScaffoldBody(
        child: SingleChildScrollView(
          physics: const PageScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: FontThemes.title,
              ),
              SizedBox(height: size.height * 0.032),
              const SignInForm(),
            ],
          ),
        ),
      ),
    );
  }
}
