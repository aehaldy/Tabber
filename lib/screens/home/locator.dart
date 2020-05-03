import 'package:location/location.dart';

class Locator {
  //this "simply" runs a function to
  // get user location
  // and identify the asset by BC from DB
  // and update its lat and long values
  Location location = new Location();


  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

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
    print('What exactly IS permission status??--> $_permissionGranted');
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


  Future locationUpdate (String barcode) async {
    await isServiceEnabled();
    await isPermissionGranted();
    print('And checking Permission granted again--->$_permissionGranted');
    if (_permissionGranted == PermissionStatus.granted) {
      // PUT item by barcode with loc data
      await getLocationData();
      print('....PUT by barcode $barcode......');
      print('Gotchyo loco!! ~~~~>> ${_locationData.latitude}');
      }
  }

}

