import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AddHomeModel extends ChangeNotifier {
  AddHomeModel(this.eMailAddress);
  String homeName = '';
  String eMailAddress = ''; // test

  Future addHomeDataBase() async {
    if (homeName.isEmpty) {
      throw ('ホーム名が空白です。');
    }

    Firestore.instance.collection('home_information').add(
      {
        'home_name': homeName,
        'email_address': eMailAddress,
      },
    );
  }
}
