import 'package:aredoco/domain/home.dart';
import 'package:aredoco/domain/permission.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class HomeListModel extends ChangeNotifier {
  List<Permission> permissions;
  List<Home> homes = [];

  HomeListModel(this.permissions);

  Future fetchHomeNameList() async {
    List<DocumentSnapshot> docs = List(permissions.length);
    List<Home> homes = List(permissions.length);

    for (int i = 0; i < permissions.length; i++) {
      docs[i] = await Firestore.instance
          .collection('home_information')
          .document(permissions[i].homeInformationId)
          .get();

      // ↓値はそれぞれちゃんと持ってるっぽい
      debugPrint('fetchHomeNameList().homeName= ' + docs[i]['home_name']);
      debugPrint('fetchHomeNameList().documentID= ' + docs[i].documentID);
      debugPrint('fetchHomeNameList().permissionType= ' +
          permissions[i].permissionType.toString());

      // ↓ここで[Unhandled Exception: NoSuchMethodError: The setter 'homeName=' was called on null.]のエラー。確かにnullで初期化されてると思うけど…
      homes[i].homeName = docs[i]['home_name'];
      homes[i].documentId = docs[i].documentID;
      homes[i].permission = permissions[i].permissionType;
    }

    this.homes = homes;

    notifyListeners();
  }
}
