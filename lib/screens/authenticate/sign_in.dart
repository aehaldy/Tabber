import 'package:flutter/material.dart';
import 'package:tabber/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  //instance of AuthService from services/auth.dart
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
        title: Text(
          'Log in to Tabber',
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: 28,
              fontFamily: 'Lato',
            )
        ),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0)
          ),
          child: Text(
            'Login Field(s)',
            style: TextStyle(
              color: Colors.grey[50],
              fontSize: 20,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600
            ),
          ),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if (result == null) {
              print('User login failed');
            } else {
              print('Signed in User ${result.uid}');
            }
          },
        )
      ),
      );
  }
}
