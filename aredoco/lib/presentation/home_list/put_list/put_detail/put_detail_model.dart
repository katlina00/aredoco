import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class PutDetailModel extends ChangeNotifier {
  PutDetailModel(this.putDocumentId);
  String putDocumentId = '';
  String objectName = '';
  String category = '';
  int floor = 0;
  String detailInformation = '';
  var doc = null;

  Future fetchPutDetail() async {
    DocumentSnapshot doc =
        await Firestore.instance.collection('put_list').document(putDocumentId).get();

    this.doc = doc.data;

    notifyListeners();
  }

  void updateAccessCount() {
    // todo:更新ロジック
  }
}
