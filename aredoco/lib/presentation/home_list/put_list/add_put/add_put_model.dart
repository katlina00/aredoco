import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AddPutModel extends ChangeNotifier {
  String picturePath = '';
  String homeInformationId;
  String objectName = '';
  String category = '';
  int floor = 0;
  String detailInformation = '';
  int accessCount = 0;
  String lastUpdateUserId = '';
  String lastUpdateUserName = '';
  String lastUpdateDateTime = '';

  AddPutModel(this.homeInformationId);

  Future addPutDetailDataBase() async {
    if (objectName.isEmpty) {
      throw ('必須項目が空白です。');
    }

    if (floor is! int) {
      throw ('フロアは半角数字で入力してください。'); // うまく動いてない
    }

    Firestore.instance.collection('put_list').add(
      {
        'picture_path': picturePath,
        'home_information_id': homeInformationId,
        'object_name': objectName,
        'category': category,
        'floor': floor,
        'detail_information': detailInformation,
        'access_count': accessCount,
        'last_update_user_id': lastUpdateUserId,
        'last_update_user_name': lastUpdateUserName,
        'last_update_date_time': Timestamp.now(),
      },
    );
  }
}
