import 'package:base/presentation/utils/theme/color_themes.dart';
import 'package:base/presentation/utils/theme/font_themes.dart';
import 'package:flutter/material.dart';

class ScaffoldBody extends StatelessWidget {
  final Widget child;
  const ScaffoldBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorThemes.backgroundDarkContrast,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: size.height * 0.075,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const FlutterLogo(size: 100),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'Somos Innovación\n& Talento',
                    textAlign: TextAlign.center,
                    style: FontThemes.buttonEnable,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 25,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Container(
                  height: size.height * 0.63,
                  width: size.width,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: ColorThemes.backgroundLight,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
