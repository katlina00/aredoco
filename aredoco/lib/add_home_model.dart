import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AddHomeModel extends ChangeNotifier {
  String homeName = '';
  String EMailAddress = 'mofu@gmail.com'; // test

  Future addHomeDataBase() async {
    if (homeName.isEmpty) {
      throw ('ホーム名が空白です。');
    }

    Firestore.instance.collection('home_information').add(
      {
        'home_name': homeName,
        'email_address': EMailAddress, // 暫定でeメールアドレスにしてるけど、ユーザID（ユーザには不可視）がいいかも
      },
    );
  }
}
