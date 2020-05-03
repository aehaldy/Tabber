import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabber/models/user.dart';
import 'package:tabber/screens/authenticate/authenticate.dart';
import 'package:tabber/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    if (user != null) {
      return Home();
    } else {
      return Authenticate();
    }

  }
}
