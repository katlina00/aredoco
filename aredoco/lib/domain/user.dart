import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User(DocumentSnapshot doc) {
    documentId = doc.documentID;
    userName = doc['user_name'];
    eMailAddress = doc['email_address'];
  }

  String documentId;
  String userName;
  String eMailAddress;
}
