import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_barcode_scanner_widget.dart';

///
/// FullScreenScannerPage
class FullScreenScannerPage extends StatefulWidget {
  @override
  _FullScreenScannerPageState createState() => _FullScreenScannerPageState();
}

class _FullScreenScannerPageState extends State<FullScreenScannerPage> {
  var  _code = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_code.value),
      ),
      body: Column(
        children: [
          Expanded(
            child: AppBarcodeScannerWidget.defaultStyle(
              resultCallback: (String code) {
                  _code.value = code;
                  // Get.back(result: code);
                  Get.offNamed('/myStepper', arguments: code);
              },
              openManual: true,
            ),
          ),
        ],
      ),
    );
  }
}
