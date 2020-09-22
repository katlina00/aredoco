import 'package:aredoco/domain/put.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class PutListModel extends ChangeNotifier {
  List<Put> puts = [];
  String homeInformationId;

  PutListModel(this.homeInformationId);

  Future fetchPutList() async {
    final docs = await Firestore.instance
        .collection('put_list')
        .where('home_information_id', isEqualTo: homeInformationId)
        .getDocuments();
    final puts = docs.documents
        .map((doc) => Put(doc))
        .toList();

    this.puts = puts;

    debugPrint('PutListModel:' + 'homeInformationId= ' + homeInformationId);

    notifyListeners();
  }
}
