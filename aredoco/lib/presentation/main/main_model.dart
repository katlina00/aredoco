import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  FirebaseUser user;

  void setUser(FirebaseUser currentUser) {
    user = currentUser;
  }

  notifyListeners();
}
