import 'package:cloud_firestore/cloud_firestore.dart';

class Permission{
  String homeInformationId;
  String eMilAddress;
  int permissionType;

  Permission(DocumentSnapshot doc){
    homeInformationId = doc['home_information_id'];
    permissionType = doc['permission_type'];
    eMilAddress = doc['email_address'];
  }
}