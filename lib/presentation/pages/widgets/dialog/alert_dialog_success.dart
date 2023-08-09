import 'package:base/presentation/utils/theme/color_themes.dart';
import 'package:base/presentation/utils/theme/font_themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> alertDialogSuccess(
    {required BuildContext context, required String message}) async {
  return showDialog<void>(
    context: context,

    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return _AlertDialog(
        message: message,
      );
    },
  );
}

class _AlertDialog extends StatelessWidget {
  final String message;
  const _AlertDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AlertDialog(
      backgroundColor: ColorThemes.backgroundLight,
      contentPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              padding: EdgeInsets.zero,
              splashRadius: 20,
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.close,
                color: ColorThemes.accentDark,
              ),
            ),
          ),
          const Icon(
            CupertinoIcons.checkmark_alt_circle,
            color: ColorThemes.successDark,
            size: 64,
          ),
          SizedBox(height: size.height * 0.016),
          Text(
            message,
            textAlign: TextAlign.center,
            softWrap: true,
            style: FontThemes.label,
          ),
        ],
      ),
    );
  }
}
