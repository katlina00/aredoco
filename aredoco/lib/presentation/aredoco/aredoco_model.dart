import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

class AredocoModel extends ChangeNotifier {
  String eMailAddress = '';
  String userName = '';
  String uid = '';

  Future fetchUserData() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    uid = user.uid; // UID取得

    var userData = await Firestore.instance.collection('users').document(uid).get();
    userName = userData.data['user_name']; // ユーザ名取得
    eMailAddress = userData.data['email_address']; // メールアドレス取得
    debugPrint('userName= ' + userName + '　　　eMailAddress= ' + eMailAddress);
    notifyListeners();
  }
}
