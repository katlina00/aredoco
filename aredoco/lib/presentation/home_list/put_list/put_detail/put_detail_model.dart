import 'package:aredoco/domain/put.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class PutDetailModel extends ChangeNotifier {
  var doc;

  PutDetailModel(this.doc);

  Future fetchPutDetail() async {
    DocumentSnapshot doc =
        await Firestore.instance.collection('put_list').document().get();

    this.doc = doc.data;

    notifyListeners();
  }

  void updateAccessCount() {
    // todo:更新ロジック
  }
}
