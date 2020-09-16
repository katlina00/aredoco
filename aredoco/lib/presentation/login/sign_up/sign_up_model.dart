import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignUpModel extends ChangeNotifier {
  String eMailAddress = '';
  String password = '';
  String userUid = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUp() async {
    if (eMailAddress.isEmpty || password.isEmpty) {
      throw ('メールアドレスまたはパスワードが空です');
    }
    final FirebaseUser user =
        (await _auth.createUserWithEmailAndPassword(email: eMailAddress, password: password)).user;
    final email = user.email;

    // FirestoreのusersコレクションにドキュメントIDを指定してユーザ情報を追加
    Firestore.instance.collection('users').document(user.uid).setData(
      {
        'email_address': email,
        'user_name': email,
        'created_at': Timestamp.now(),
      },
    );
  }
}
