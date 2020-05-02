import 'package:flutter/material.dart';
import 'package:tabber/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:tabber/services/auth.dart';
import 'package:tabber/models/user.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:barcode_scan/barcode_scan.dart';
//import 'package:location/location.dart';
//import 'package:map_launcher/map_launcher.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This is the root of the application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
        child: MaterialApp(
          title: 'Tabber',
          home: Wrapper(),
        ),
    );
  }
}
