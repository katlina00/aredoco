import 'package:aredoco/domain/put.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class PutListModel extends ChangeNotifier {
  List<Put> puts = [];

  Future fetchPutList() async {
    final docs = await Firestore.instance
        .collection('put_list')
        .getDocuments(); //.where('home_information_id', isEqualTo: homeInformationId)
    final puts = docs.documents
        .map((doc) => Put(
              doc.documentID,
              doc['home_information_id'],
              doc['picture_path'],
              doc['object_name'],
              doc['category'],
              doc['floor'],
              doc['detail_information'],
              doc['access_count'],
              doc['last_update_user_id'],
              doc['last_update_user_name'],
              doc['last_update_date_time'],
            ))
        .toList();

    this.puts = puts;
    notifyListeners();
  }
}
