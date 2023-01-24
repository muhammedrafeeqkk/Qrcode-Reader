import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScreenCamera extends StatefulWidget {
  const ScreenCamera({Key? key}) : super(key: key);

  @override
  State<ScreenCamera> createState() => _ScreenCameraState();
}

class _ScreenCameraState extends State<ScreenCamera> {
  String? Scanresult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanner'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
              onPressed: scanCode,
              icon: Icon(Icons.camera),
              label: Text('open camera')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(Scanresult == null
                ? 'Scan a Code!'
                : "scan Resul : $Scanresult"),
          )
        ],
      )),
    );
  }

  Future scanCode() async {
    String Scanresult;

    try {
      Scanresult = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      Scanresult = "Failed toGet Code Version!";
    }
    setState(() => this.Scanresult = Scanresult);
    //  if (!mounted) return;
  }
}
