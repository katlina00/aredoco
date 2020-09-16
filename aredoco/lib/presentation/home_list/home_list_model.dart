import 'package:aredoco/domain/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class HomeListModel extends ChangeNotifier {
  List<Home> homes = [];
  String eMailAddress;
  String homeName;

  HomeListModel(this.eMailAddress);

  Future fetchHomeNameList() async {
    debugPrint('homeName= ' + homeName + '　　　eMailAddress= ' + eMailAddress);
    final docs = await Firestore.instance
        .collection('home_information')
        .where('email_address', isEqualTo: eMailAddress) // Eメールアドレス（アクセスキー情報）が合致する条件のみ取得する
        .getDocuments();
    final homes =
        docs.documents.map((doc) => Home(doc['home_name'], doc.documentID, eMailAddress)).toList();
    this.homes = homes;

    notifyListeners();
  }
}
