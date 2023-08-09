import 'dart:developer';
import 'dart:io';

import 'package:barcode_scanner/json/common_data.dart';
import 'package:base/presentation/pages/widgets/dialog/alert_dialog_failure.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scanner/barcode_scanning_data.dart';
import 'package:barcode_scanner/scanbot_barcode_sdk.dart';
import 'package:barcode_scanner/scanbot_sdk_models.dart';
import 'package:image_picker/image_picker.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  @override
  void initState() {
    super.initState();
    _initSdk();
  }

  void _initSdk() {
    const String licenseKey =
        "cQ7n2vMMoovxSkH6njZTNhLzbEtgBsn+M6K0YSUVCHD1T4/1WBC5ggWpoNmoXwCx1N2WvScXFD0XCoaSOouLPeKfnyASltVRTl/mZm7wGLzGZFCL2Jw3p+4CSPjvg8lvfZN8Dt7CK2nlhJIgMi0HS26RNwf8a1mzt+BArapzEOCKmlKpT+NFhSpJqBh5l6pYkoJly/aAiQBjGZtT9gllX2IEizj5FlxiYD6D0WrM1GcnBDtdna3nS1bnf8oRx7qRJrxThoq9UWvWBOe5HisQElP6OHW/uUFvxyay+F1DfrFnTYnH1K0VJgIOQER4hazxg4hgkWuW1zSet7XhGkubwA==\nU2NhbmJvdFNESwpjb20uZXhhbXBsZS5iYXNlCjE2OTIyMzAzOTkKODM4ODYwNwoxOQ==\n";

    var config = ScanbotSdkConfig(licenseKey: licenseKey, loggingEnabled: true);
    ScanbotBarcodeSdk.initScanbotSdk(config);
  }

  Future<bool> checkLicenseStatus() async {
    final result = await ScanbotBarcodeSdk.getLicenseStatus();
    if (result.isLicenseValid) {
      return true;
    }
    log('Scanbot SDK (trial) period or license has expired.');
    return false;
  }

  Future<String> _importImage() async {
    final XFile? file =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    try {
      var result = await ScanbotBarcodeSdk.detectFromImageFile(
        File(file!.path).uri,
        barcodeFormats: [BarcodeFormat.PDF_417],
      );
      return result.toJson().toString();
    } catch (e) {
      log("Error Gallery");
      return e.toString();
    }
  }

  Future<String> _startBarcodeScanner() async {
    if (!await checkLicenseStatus()) {
      return "";
    }

    try {
      var config = BarcodeScannerConfiguration(
        topBarBackgroundColor: const Color(0xFFc8193c),
        barcodeFormats: [BarcodeFormat.PDF_417],
        cameraOverlayColor: Colors.amber,
        finderAspectRatio: const FinderAspectRatio(width: 4, height: 2),
        finderTextHint:
            'Please align any supported barcode in the frame to scan it.',
        /*  additionalParameters: BarcodeAdditionalParameters(
          enableGS1Decoding: false,
          minimumTextLength: 10,
          maximumTextLength: 11,
          minimum1DBarcodesQuietZone: 10,
        )*/
        //cameraZoomFactor: 0.5,
        // ...
      );
      var result = await ScanbotBarcodeSdk.startBarcodeScanner(config);

      log(result.toJson().toString());
      return result.toJson().toString();
    } catch (e) {
      log(e.toString());
      return e.toString();
    }
  }

  Future<void> showAlertDialog(BuildContext context, String textToShow,
      {String? title}) async {
    Widget text = SimpleDialogOption(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(textToShow),
      ),
    );

    // set up the SimpleDialog
    final dialog = AlertDialog(
      title: title != null ? Text(title) : null,
      content: text,
      contentPadding: const EdgeInsets.all(0),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );

    // show the dialog
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                alertDialogFailure(
                  context: context,
                  message: await _startBarcodeScanner(),
                );
              },
              child: const Text("Camara"),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                alertDialogFailure(
                  context: context,
                  message: await _importImage(),
                );
              },
              child: const Text("Galeria"),
            ),
          ],
        ),
      ),
    );
  }
}
