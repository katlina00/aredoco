class Put {
  Put(this.homeInformationId, this.objectName, this.documentId);

  Put.detail(this.homeInformationId, this.objectName, this.category);

  String homeInformationId;
  String objectName;
  String category;
  int floor;
  String detailInformation;
  String picturePath;
  int accessCount;
  String lastUpdateUserId;
  String lastUpdateUserName;
  String lastUpdateDateTime;
  String documentId;
}
