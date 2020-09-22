import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AddHomeModel extends ChangeNotifier {

  String homeName = '';
  String eMailAddress = '';


  AddHomeModel(this.eMailAddress);

  Future addHomeDataBase() async {
    if (homeName.isEmpty) {
      throw ('ホーム名が空白です。');
    }

    await Firestore.instance.collection('home_information').add(
      {
        'home_name': homeName,
        'email_address': eMailAddress,
      },
    );
  }
}
