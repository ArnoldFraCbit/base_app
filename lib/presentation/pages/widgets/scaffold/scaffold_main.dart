import 'package:base/presentation/utils/theme/color_themes.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ScaffoldMain extends StatelessWidget {
  final Widget child;
  final VoidCallback navigator;
  const ScaffoldMain({
    super.key,
    required this.child,
    required this.navigator,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorThemes.backgroundDarkContrast,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: const FlutterLogo(
          size: 35,
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorThemes.transparent,
        actions: [
          IconButton(
            splashRadius: 25,
            padding: EdgeInsets.zero,
            icon: const Icon(
              MdiIcons.logout,
              color: ColorThemes.backgroundLight,
            ),
            onPressed: navigator,
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Container(
              height: 650,
              width: size.width * 0.94,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorThemes.backgroundLight,
                borderRadius: BorderRadius.circular(50),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
