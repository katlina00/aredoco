import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User {
  String uid;
  String documentId;
  String userName;
  String eMailAddress;

  User(FirebaseUser user, DocumentSnapshot doc) {
    uid = user.uid;
    documentId = doc.documentID;
    userName = doc['user_name'];
    eMailAddress = doc['email_address'];
  }


}
