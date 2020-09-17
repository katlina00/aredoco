import 'package:cloud_firestore/cloud_firestore.dart';

class Put {
  String homeInformationId;
  String objectName;
  String category;
  int floor;
  String detailInformation;
  String picturePath;
  int accessCount;
  String lastUpdateUserId;
  String lastUpdateUserName;
  Timestamp lastUpdateDateTime;
  String documentId;

  Put(
    this.documentId,
    this.homeInformationId,
    this.picturePath,
    this.objectName,
    this.category,
    this.floor,
    this.detailInformation,
    this.accessCount,
    this.lastUpdateUserId,
    this.lastUpdateUserName,
    this.lastUpdateDateTime,
  );

  /*
  Put(DocumentSnapshot doc) {
    documentId = doc.documentID;
    homeInformationId = doc['home_information_id'];
    picturePath = doc['picture_path'];
    objectName = doc['object_name'];
    category = doc['category'];
    floor = doc['floor'];
    detailInformation = doc['detail_information'];
    accessCount = doc['access_count'];
    lastUpdateUserId = doc['last_update_user_id'];
    lastUpdateUserName = doc['last_update_user_name'];
    lastUpdateDateTime = doc['last_update_date_time'];
  }
  */


}
