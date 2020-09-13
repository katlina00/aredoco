import 'package:aredoco/domain/put.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class PutListModel extends ChangeNotifier {
  PutListModel(this.homeInformationId, this.homeName);

  List<Put> puts = [];
  String homeInformationId = '';
  String homeName;

  Future fetchPutList() async {
    final docs = await Firestore.instance
        .collection('put_list')
        .where('home_information_id', isEqualTo: homeInformationId)
        .getDocuments();
    final putList = docs.documents
        .map((doc) => Put(doc['home_information_id'], doc['object_name'], doc.documentID))
        .toList();
    this.puts = putList;

    notifyListeners();
  }
}
