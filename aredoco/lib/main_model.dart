import 'package:aredoco/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class MainModel extends ChangeNotifier {
  String myEMailAddress = 'mofu@gmail.com'; // test
  List<Home> homes = [];

  String homeName = '';
  String userName = 'せいじ'; // test
  String appBarTitleParts = 'さんのホーム一覧';

  Future fetchHomeNameList() async {
    final docs = await Firestore.instance
        .collection('home_information')
        .where('email_address',
            isEqualTo: myEMailAddress) // Eメールアドレス（アクセスキー情報）が合致する条件のみ取得する
        .getDocuments();
    final homeNameList = docs.documents
        .map((doc) => Home(doc['home_name'], doc.documentID, myEMailAddress))
        .toList();
    this.homes = homeNameList;

    final docIdList = notifyListeners();
  }
}
