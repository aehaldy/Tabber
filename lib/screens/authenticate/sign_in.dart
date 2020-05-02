import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        //backgroundColor: Colors.orange,
        elevation: 0.0,
        title: Text(
          'Log in to Tabber',
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: 28,
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
            ),
          ),
          onPressed: () async {

          },
        )
      ),
      );
  }
}
