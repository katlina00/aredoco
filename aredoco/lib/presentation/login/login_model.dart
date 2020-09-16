import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LoginModel extends ChangeNotifier {
  String eMailAddress = '';
  String password = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUp() async {
    if (eMailAddress.isEmpty || password.isEmpty) {
      throw ('メールアドレスまたはパスワードが空です');
    }
    await _auth.signInWithEmailAndPassword(email: eMailAddress, password: password);
  }
}
