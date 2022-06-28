import 'dart:convert';

/// AuditEntityId : 2832
/// AuditId : 82
/// AuditEntityName : "India"
/// AuditEntityTypeId : 893
/// AuditParentEntityId : 0
/// SequenceNo : 1
/// EntityEndDate : "2021-11-15T11:29:03"
/// IsLeafNode : false
/// BarcodeNFC : "1593549198"
/// EntityLevel : 1
/// EntityException : false
/// ScheduleOccurrenceIds : "304"

AuditModel auditModelFromJson(String str) => AuditModel.fromJson(json.decode(str));
String auditModelToJson(AuditModel data) => json.encode(data.toJson());
class AuditModel {
  AuditModel({
      this.auditEntityId, 
      this.auditId, 
      this.auditEntityName, 
      this.auditEntityTypeId, 
      this.auditParentEntityId, 
      this.sequenceNo, 
      this.entityEndDate, 
      this.isLeafNode, 
      this.barcodeNFC, 
      this.entityLevel, 
      this.entityException, 
      this.scheduleOccurrenceIds,});

  AuditModel.fromJson(dynamic json) {
    auditEntityId = json['AuditEntityId'];
    auditId = json['AuditId'];
    auditEntityName = json['AuditEntityName'];
    auditEntityTypeId = json['AuditEntityTypeId'];
    auditParentEntityId = json['AuditParentEntityId'];
    sequenceNo = json['SequenceNo'];
    entityEndDate = json['EntityEndDate'];
    isLeafNode = json['IsLeafNode'];
    barcodeNFC = json['BarcodeNFC'];
    entityLevel = json['EntityLevel'];
    entityException = json['EntityException'];
    scheduleOccurrenceIds = json['ScheduleOccurrenceIds'];
  }
  int? auditEntityId;
  int? auditId;
  String? auditEntityName;
  int? auditEntityTypeId;
  int? auditParentEntityId;
  int? sequenceNo;
  String? entityEndDate;
  bool? isLeafNode;
  String? barcodeNFC;
  int? entityLevel;
  bool? entityException;
  String? scheduleOccurrenceIds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['AuditEntityId'] = auditEntityId;
    map['AuditId'] = auditId;
    map['AuditEntityName'] = auditEntityName;
    map['AuditEntityTypeId'] = auditEntityTypeId;
    map['AuditParentEntityId'] = auditParentEntityId;
    map['SequenceNo'] = sequenceNo;
    map['EntityEndDate'] = entityEndDate;
    map['IsLeafNode'] = isLeafNode;
    map['BarcodeNFC'] = barcodeNFC;
    map['EntityLevel'] = entityLevel;
    map['EntityException'] = entityException;
    map['ScheduleOccurrenceIds'] = scheduleOccurrenceIds;
    return map;
  }

}