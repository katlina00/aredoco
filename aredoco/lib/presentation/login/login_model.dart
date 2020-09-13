import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LoginModel extends ChangeNotifier {
  String mailAddress = '';
  String password = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUp() async {
    if (mailAddress.isEmpty || password.isEmpty) {
      throw ('メールアドレスまたはパスワードが空です');
    }
    await _auth.signInWithEmailAndPassword(
        email: mailAddress, password: password);

    // todo :　ログイン情報をローカルに保存して、セッションを保存する
  }
}
