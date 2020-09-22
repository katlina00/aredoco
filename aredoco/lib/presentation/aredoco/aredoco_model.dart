import 'package:aredoco/domain/permission.dart';
import 'package:aredoco/domain/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

class AredocoModel  {
  List<Permission> permissions;
  User userData;
  Permission permission;

  Future<bool> fetchUserData() async {
  final FirebaseUser user = await FirebaseAuth.instance.currentUser();

  final userDoc = await Firestore.instance.collection('users').document(user.uid).get();

  userData = User(user,userDoc);

  return true;
  }

  Future<bool> fetchUserPermissionList() async {
    final userPermissionDocs = await Firestore.instance
        .collection('permission_list')
        .where('email_address', isEqualTo: userData.eMailAddress)
        .getDocuments();

    final permissions =
    userPermissionDocs.documents.map((userPermissionDoc) => Permission(userPermissionDoc)).toList();

    this.permissions = permissions;

    debugPrint('fetchUserPermissionList().length= ' + permissions.length.toString());

    for(int i = 0; i < permissions.length; i++){
      debugPrint('fetchUserPermissionList()= ' + permissions[i].homeInformationId + ' / ' + permissions[i].permissionType.toString());
    }

    return true;
  }

}
