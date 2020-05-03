import 'package:flutter/material.dart';
import 'package:tabber/models/asset.dart';

class Directions extends StatelessWidget {

  final Function toggleSeeking;
  final Asset asset;
  Directions({
    this.toggleSeeking,
    this.asset,
  });

  // Inside the build, display asset deets
  // And parse long and lat from asset props
  // Then insert the MapLauncher boilerplate! :D

  @override
  Widget build(BuildContext context) {
    print('\n-----I have an ASSET!---->');
    print(asset);
    return Container(
      child: Text('Directions <3')
    );
  }
}

/*
appBar: AppBar(
  ..
  actions: <Widget>[
    FlatButton.icon(
      icon: Icon(Icons.????),
      label: Text('Search'),
      onPressed: () {

      }
    )
  ]
)
*/
