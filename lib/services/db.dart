import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tabber/models/asset.dart';

class DatabaseService {

  //collection reference
  final CollectionReference assetCollection = Firestore.instance.collection('assets');

  // create Asset obj from Firestore data
  Asset _assetFromDocument(DocumentSnapshot doc) {
    Asset asset = Asset(
      id: doc.documentID,
      barcode: doc.data['barcode'],
      name: doc.data['name'],
      vid: doc.data['vid'],
      scannedBy: doc.data['scannedBy'],
      lat: doc.data['lat'],
      long: doc.data['long'],
    );
    return asset;
  }

  //"GET" asset by VID lookup
  Future getAsset(String vid) async {
    List<DocumentSnapshot> docList;
    try {
      docList = (await assetCollection
      .where("vid", isEqualTo: vid)
      .getDocuments())
      .documents;
      if (docList.length > 0) {
        return _assetFromDocument(docList[0]);
      } else {
        return null;
      }
    } catch (err) {
      print('Error getting the Asset data -->');
      print(err.message);
      return err.message;
    }
  }

  //"PUT" asset location by barcode lookup


}
