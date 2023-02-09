import 'package:base/domain/entities/user.dart';
import 'package:base/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:base/presentation/pages/sign_in/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  void initState() {
    context
        .read<SignInBloc>()
        .add(SignInSubmitted(resquest: User(user: 'user', pass: 'pass')));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (BuildContext context, SignInState state) {},
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomForm(),
      ),
    );
  }
}
