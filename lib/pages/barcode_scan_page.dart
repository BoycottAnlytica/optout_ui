import 'package:flutter/material.dart';

import 'package:optout_ui/core/barcode/barcode_scan_service.dart';

class BarcodeScanPage extends StatefulWidget {
  const BarcodeScanPage({super.key});

  @override
  BarcodeScanPageState createState() => BarcodeScanPageState();
}

class BarcodeScanPageState extends State<BarcodeScanPage> {

  final BarcodeScannerService barcodeScannerService = BarcodeScannerService();
  String _scanBarcode = 'Unknown';

  Future<void> scanBarcode() async {
    String barcodeScanRes = await barcodeScannerService.scanBarcode();
    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Barcode Scan')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => scanBarcode(),
              child: const Text('Start Barcode Scan'),
            ),
            const SizedBox(height: 20),
            Text(
              'Scan result: $_scanBarcode\n',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
