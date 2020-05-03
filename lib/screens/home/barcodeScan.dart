import 'package:barcode_scan/barcode_scan.dart';

class Barcode {

  String _barcode;

  Future scan () async {
    var result = await BarcodeScanner.scan();

    print(result.type); // The result type (barcode, cancelled, failed)
    print('Raw Content, Baby! --> ${result.rawContent}');
    print(result.format); // The barcode format (as enum)

    if (result.rawContent.isNotEmpty){
       _barcode = result.rawContent;
    } else {
      _barcode = null;
    }

    return _sendScanData();
  }

  String _sendScanData () {
    return _barcode;
  }
}
