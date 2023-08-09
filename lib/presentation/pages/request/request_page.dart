import 'package:base/presentation/pages/request/widgets/request_form.dart';
import 'package:base/presentation/pages/widgets/scaffold/scaffold_main.dart';
import 'package:base/presentation/utils/theme/font_themes.dart';
import 'package:base/presentation/utils/app_routes.dart';
import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScaffoldMain(
      navigator: transitionToAuth,
      child: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Requerimiento',
                style: FontThemes.title,
              ),
              SizedBox(height: size.height * 0.032),
              const RequestForm(),
            ],
          ),
        ),
      ),
    );
  }
}
