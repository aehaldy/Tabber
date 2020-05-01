import 'package:flutter/material.dart';
import 'package:tabber/screens/auth/auth.dart';
import 'package:tabber/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //return either Home or Auth depending on signin status
    return Home();
  }
}
