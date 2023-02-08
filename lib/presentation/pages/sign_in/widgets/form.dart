import 'package:base/presentation/pages/widgets/input.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  CustomForm({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: const <Input>[
            Input(),
            Input(),
          ],
        ));
  }
}
