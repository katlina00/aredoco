import 'package:aredoco/put.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class PutListModel extends ChangeNotifier {
  PutListModel(this.homeInformationId);

  List<Put> puts = [];
  String homeInformationId = '';

  Future fetchPutList() async {
    final docs = await Firestore.instance
        .collection('put_list')
        .where('home_information_id', isEqualTo: homeInformationId)
        .getDocuments();
    final putList = docs.documents
        .map((doc) => Put(doc['home_information_id'], doc['object_name']))
        .toList();
    this.puts = putList;

    final docIdList = notifyListeners();
  }
}
