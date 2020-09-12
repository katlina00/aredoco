import 'package:aredoco/put.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class PutDetailModel extends ChangeNotifier {
  PutDetailModel(this.putDocumentId);
  String putDocumentId = '';
  String objectName = '';
  String category = '';
  int floor = 0;
  String detailInformation = '';
  var doc;

  Future fetchPutDetail() async {
    doc = await Firestore.instance
        .collection('put_list')
        .document(putDocumentId)
        .get();

    notifyListeners();
  }
}
