import 'package:flutter/material.dart';
import 'package:tabber/models/asset.dart';
import 'package:tabber/screens/home/search/directions.dart';
import 'package:tabber/screens/home/search/searchForm.dart';
import 'package:tabber/services/db.dart';

class ViewHandler extends StatefulWidget {
  @override
  _ViewHandlerState createState() => _ViewHandlerState();
}

class _ViewHandlerState extends State<ViewHandler> {

  final DatabaseService _db = DatabaseService();

  Asset asset;
  bool _seekingAsset = false;

  void toggleSeeking() {
    setState(() => _seekingAsset = !_seekingAsset);
  }

  void searchForAsset(String vid) {
    void setAssetState (a) async {
      dynamic data = await _db.getAsset(vid);
      if (data == null) {
        //toast note that it's NOT FOUND
        print('ASSET SEARCH RETURNED NULL!');
      } else {
        setState(() => asset = data);
        toggleSeeking();
      }
    }
    setAssetState(asset);
  }

  @override
  Widget build(BuildContext context) {
    if (_seekingAsset){
      return Directions(toggleSeeking: toggleSeeking, asset: asset);
    } else {
      return SearchForm(searchForAsset: searchForAsset);
    }
  }
}
