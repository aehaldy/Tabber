import 'package:flutter/material.dart';
import 'package:tabber/screens/home/barcodeScan.dart';
import 'package:tabber/screens/home/locator.dart';
import 'package:tabber/screens/home/search/viewHandler.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Locator locator = new Locator();
    Barcode bcScanner = new Barcode();

    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0.0,
        title: Text(
          'Keep tabs on it.',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 28,
              fontFamily: 'Lato',
            )
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(
              height: 150.0
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              image: DecorationImage(
                image: AssetImage('assets/TabberLogo.png'),
                fit: BoxFit.none,
              ),
            ),
            child: Text('Tabber',
              style: TextStyle(
                color: Colors.orange,
                fontFamily: 'BowlbyOne',
                fontSize: 52,
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            height: 70,
            width: 180,
            child: Builder(
              builder: (context) => RaisedButton(
                color: Colors.orange,
                splashColor: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.0),
                ),
                child: Text('Scan',
                  style: TextStyle(
                    color: Colors.grey[50],
                    fontSize: 32,
                    fontFamily: 'Lato'
                  ),
                ),
                onPressed: () async {
                  String barcode = await bcScanner.scan();
                  await locator.locationUpdate(barcode);
                  String result = locator.getSnackMsg();
                  Scaffold.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.orange[600],
                    content: Text(result),
                    duration: Duration(seconds: 4),
                  ));
                },
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            height: 70,
            width: 180,
            child: RaisedButton(
            color: Colors.orange,
            splashColor: Colors.orangeAccent,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.0)
            ),
            child: Text('Find',
              style: TextStyle(
                color: Colors.grey[50],
                fontSize: 32,
                fontFamily: 'Lato'
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewHandler()),
              );
            },
          ),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
