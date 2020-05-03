import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tabber/models/asset.dart';

class DatabaseService {

  //collection reference
  final CollectionReference assetCollection = Firestore.instance.collection('assets');

  //"GET" asset by VID lookup
  Future getAsset(String vid) async {
    try {
      await assetCollection.where("vid", isEqualTo: vid)
      .getDocuments()
      .then((QuerySnapshot docs) {
        if (docs.documents.isNotEmpty) {
          return Asset.fromData(docs.documents[0].data);
        }
        return null;
      });
    } catch (err) {
      print('Error getting the Asset data -->');
      print(err.toString());
    }


  }

  // Future getAsset(String vid) {
  //   return assetCollection.where("vid", isEqualTo: vid).getDocuments();
  // }

  //"PUT" asset location by barcode lookup

}
