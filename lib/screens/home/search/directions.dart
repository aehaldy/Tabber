import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:tabber/models/asset.dart';

class Directions extends StatelessWidget {

  final Function toggleSeeking;
  final Asset asset;
  Directions({
    this.toggleSeeking,
    this.asset,
  });

  // Inside the build, display asset deets

  openMapsSheet(context) async {
  try {
    final title = 'ID: ${this.asset.vid}';
    final description = this.asset.name;
    var lat = double.parse(this.asset.lat);
    assert(lat is double);
    var long = double.parse(this.asset.long);
    final coords = Coords(lat, long);
    final availableMaps = await MapLauncher.installedMaps;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  for (var map in availableMaps)
                    ListTile(
                      onTap: () => map.showMarker(
                        coords: coords,
                        title: title,
                        description: description,
                      ),
                      title: Text(map.mapName),
                      leading: Image(
                        image: map.icon,
                        height: 20.0,
                        width: 20.0,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
    } catch (err) {
      print(err.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String assetName = this.asset.name;
    final String assetVID = this.asset.vid;
    final String assetScanned = this.asset.scannedBy;

    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
        title: Text('#$assetVID',
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: 28,
              fontFamily: 'Lato',
            )
        ),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.backspace,
              color: Colors.orange,
              //size: 24.0,
            ),
            label: Text('Redo Search',
              style: TextStyle(
                color: Colors.orange,
                fontFamily: 'OpenSans',
              )
            ),
            onPressed: () {
              toggleSeeking();
            }
          )
        ]
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: InkWell(
              splashColor: Colors.orange.withAlpha(100),
              onTap: () {
                //Check for Map Permission
                openMapsSheet(context);
              },
              child: Container(
                width: 400,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                    image: AssetImage('assets/mapBack.jpg'),
                    fit: BoxFit.cover
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.only(topLeft: const Radius.circular(15.0), topRight: const Radius.circular(15.0)),
                      ),
                      child: Text(assetName,
                      style: TextStyle(
                        color: Colors.grey[50],
                        fontSize: 22,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                    Spacer(),
                    Text('Scanned by $assetScanned',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontFamily: 'OpenSans',
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(flex: 6),
                  ]),
              ),
            ),
          ),
          Spacer(flex: 2),
        ]),
    );
  }
}

