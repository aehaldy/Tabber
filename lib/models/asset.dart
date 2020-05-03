class Asset {

  final String id;
  final String name;
  final String vid;
  final String barcode;
  final String scannedBy;
  final String  lat;
  final String  long;
  //final String stockno;

  Asset({
    this.id,
    this.name,
    this.vid,
    this.barcode,
    this.scannedBy,
    this.lat,
    this.long,
  });


  Map<String, dynamic> toJson() {
    print('Asset json MAP running!');
    return {
      'id': id,
      'name': name,
      'vid': vid,
      'barcode': barcode,
      'scannedBy': scannedBy,
      'lat': lat,
      'long': long,
    };
  }
}
