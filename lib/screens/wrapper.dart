import 'package:flutter/material.dart';
import 'package:tabber/screens/authenticate/authenticate.dart';
import 'package:tabber/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //return either Home or Login depending on status
    return Authenticate();
  }
}
