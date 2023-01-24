import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenAdd extends StatefulWidget {
  const ScreenAdd({Key? key}) : super(key: key);

  @override
  State<ScreenAdd> createState() => _ScreenAddState();
}

class _ScreenAddState extends State<ScreenAdd> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('Barcode Generator'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: BarcodeWidget(
                    data: controller.text,
                    barcode: Barcode.qrCode(),
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: TextField(
                  onSubmitted: (_) => setState(() {}),
                  controller: controller,
                  decoration: InputDecoration(
                      hintText: "enter the data",
                      suffixIcon: IconButton(
                          onPressed: () => setState(() {}),
                          icon: Icon(Icons.done))),
                ),
              )
            ],
          ),
        ));
  }
}
