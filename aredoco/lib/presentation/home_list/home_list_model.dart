import 'package:aredoco/domain/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class HomelistModel extends ChangeNotifier {
  String eMailAddress = '';
  List<Home> homes = [];

  String homeName = '';
  String userName = ''; // test
  String appBarTitleParts = 'さんのホーム一覧';

  Future fetchUserName() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String uid = user.uid.toString();

    // ユーザ名取得
    var userData = await Firestore.instance.collection('users').document(uid).get();
    userName = userData.data['user_name'].toString();
    notifyListeners();
  }

  Future fetchUserEmailAddress() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String uid = user.uid.toString();

    // ユーザメールアドレス取得
    var userData = await Firestore.instance.collection('users').document(uid).get();
    eMailAddress = userData.data['email_address'].toString();

    notifyListeners();
  }

  Future fetchHomeNameList() async {
    final docs = await Firestore.instance
        .collection('home_information')
        .where('email_address', isEqualTo: eMailAddress) // Eメールアドレス（アクセスキー情報）が合致する条件のみ取得する
        .getDocuments();
    final homeNameList =
        docs.documents.map((doc) => Home(doc['home_name'], doc.documentID, eMailAddress)).toList();
    this.homes = homeNameList;

    notifyListeners();
  }
}
