import 'package:location/location.dart';
import 'package:tabber/services/db.dart';

class Locator {

  final DatabaseService _db = DatabaseService();

  Location location = new Location();


  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  String _snackMsg;

  Future isServiceEnabled () async {
    _serviceEnabled = await location.serviceEnabled();
    if (_serviceEnabled == false) {
      _serviceEnabled = await location.requestService();
      if (_serviceEnabled == false) {
        //toast note that location is unavailable
      }
    }
    return;
  }

  Future isPermissionGranted () async {
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        // Toast note that permission hassnt been granted
        return;
      }
    }
    return;
  }

  Future getLocationData () async {
    _locationData = await location.getLocation();
    return;
  }

  String getSnackMsg () {
    return _snackMsg;
  }


  Future locationUpdate (String barcode) async {
    await isServiceEnabled();
    await isPermissionGranted();
    if (_permissionGranted == PermissionStatus.granted) {
      await getLocationData();
      String msg = await _db.updateAssetLoc(barcode, _locationData.latitude, _locationData.longitude);
      _snackMsg = msg;
    }
  }

}

