import 'package:aredoco/domain/home.dart';
import 'package:aredoco/domain/permission.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class HomeListModel extends ChangeNotifier {
  List<Home> homes = [];
  List<Permission> permissions;

  HomeListModel(this.permissions);

  Future fetchHomeNameList() async {
    List<DocumentSnapshot> docs = List(permissions.length);
    for (int i = 0; i < permissions.length; i++) {
      docs[i] = await Firestore.instance
          .collection('home_information')
          .document(permissions[i].homeInformationId)
          .get();
      debugPrint('fetchHomeNameList().homeName= ' + docs[i]['home_name']);
    }

    final homes =
        docs.map((doc) => Home(doc['home_name'], doc.documentID)).toList();

    this.homes = homes;

    notifyListeners();
  }
}
