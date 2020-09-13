import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AddPutModel extends ChangeNotifier {
  AddPutModel(this.homeInformationId);

  String homeInformationId = '';
  String objectName = '';
  String category = '';
  int floor = 0;
  String detailInformation = '';

  Future addPutDetailDataBase() async {
    if (objectName.isEmpty) {
      throw ('必須項目が空白です。');
    }

    Firestore.instance.collection('put_list').add(
      {
        'home_information_id': homeInformationId,
        'object_name': objectName,
        'category': category,
        'floor': floor,
        'detail_information': detailInformation,
      },
    );
  }
}
