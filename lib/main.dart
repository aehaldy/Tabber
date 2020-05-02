import 'package:flutter/material.dart';
import 'package:tabber/screens/wrapper.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:barcode_scan/barcode_scan.dart';
//import 'package:location/location.dart';
//import 'package:map_launcher/map_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabber',
      home: Wrapper(),
    );
  }
}
