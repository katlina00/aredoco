import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class MainModel extends ChangeNotifier {
  List<Home> homes = [];

  String homeName = '';
  String userName = 'せいじ'; // test
  String appBarTitleParts = 'さんのホーム一覧';

  Future fetchHomeNameList() async {
    final docs =
        await Firestore.instance.collection('home_information').getDocuments();
    final homeNameList =
        docs.documents.map((doc) => Home(doc['home_name'])).toList();
    this.homes = homeNameList;
    notifyListeners();
  }
}
