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

  //Stores asset data before it gets changed
  DocumentSnapshot _assetThatMoved;

  //Updates asset location information and returns new asset data
  DocumentSnapshot _updateLocation(DocumentSnapshot doc, String lat, String long) {
    doc.data['lat'] = lat;
    doc.data['long'] = long;
    return doc;
  }

  //"GET" asset by VID
  Future getAsset(String vid) async {
    List<DocumentSnapshot> docList;
    try {
      docList = (await assetCollection
      .where("vid", isEqualTo: vid)
      .getDocuments())
      .documents;
      if (docList.length > 0) {
        return _assetFromDocument(docList[0]);
      }
      return;
    } catch (err) {
      print('Error getting the Asset data -->');
      print(err.message);
      return err.message;
    }
  }

  //"GET" asset by Barcode
  Future getMovedAsset(String barcode) async {
    List<DocumentSnapshot> docList;
    try {
      docList = (await assetCollection
        .where("barcode", isEqualTo: barcode)
        .getDocuments())
        .documents;
      if (docList.length > 0) {
        _assetThatMoved = docList[0];
        return;
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
  Future updateAssetLoc(String barcode, double lat, double long) async {
    String strLat = lat.toString();
    String strLong = long.toString();
    try {
      await getMovedAsset(barcode);
      DocumentSnapshot updatedAsset = _updateLocation(_assetThatMoved, strLat, strLong);
      await assetCollection.document(updatedAsset.documentID)
        .updateData(updatedAsset.data);
      return ('We got tabs on it!');
    } catch (err) {
      print('Error updating the Asset location -->');
      print(err.message);
      return ('Failed to update. Check Barcode.');
    }
  }

}
