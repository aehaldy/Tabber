import 'package:flutter/material.dart';

class SearchForm extends StatefulWidget {

  final Function searchForAsset;
  SearchForm({ this.searchForAsset });

  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {

  final _formKey = GlobalKey<FormState>();

  //VIN-id field state
  String vid = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
        title: Text(
          'Locate an asset',
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: 28,
              fontFamily: 'Lato',
            )
        ),
      ),
      body: Column(
        children: <Widget>[
          Spacer(),
          //User should be able to specify search param:
          Text('Last 7 digits of VIN:',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 16,
              fontStyle: FontStyle.italic
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 100),
            child: Form(
              key: _formKey,
              child: TextFormField(
                cursorColor: Colors.orangeAccent,

                validator: (val) {
                  if (val.isNotEmpty && val.length == 7) {
                    return null;
                  } return 'Seven-digit code required';
                },
                decoration: new InputDecoration(
                  //labelText: "Enter password",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ) ,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orangeAccent,
                  ),
                ),
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[50],
                ),
                textAlign: TextAlign.center,
                onChanged: (val) {
                  setState(() => vid = val);
                }
              )
            ),
          ),
          Spacer(),
          SizedBox(
            height: 64,
            width: 180,
            child: RaisedButton(
              color: Colors.orange,
              splashColor: Colors.orangeAccent,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28.0),
              ),
              child: Text('Search',
                style: TextStyle(
                  color: Colors.grey[50],
                  fontSize: 32,
                  fontFamily: 'Lato'
                )
              ),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  widget.searchForAsset(vid);
                }
              },
            ),
          ),
          Spacer(flex: 2),
        ],
      )
    );
  }
}


// searchForAsset(vid);
//   if (asset == null) {
//     print('\n^V^V^V^V^^INVALID VID^^V^V^V^V^\n');
//     setVID('');
//   }
