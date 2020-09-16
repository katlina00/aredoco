import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String documentId;
  String userName;
  String eMailAddress;

  User(DocumentSnapshot doc) {
    documentId = doc.documentID;
    userName = doc['user_name'];
    eMailAddress = doc['email_address'];
  }


}
