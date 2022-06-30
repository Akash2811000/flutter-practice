import 'dart:convert';
/// Fees : {"Amount":10000,"Status":"false"}
/// Result : {"Hindi":80,"Eng":80,"Math":60,"Total":55.487,"Grade":"A"}
/// _id : "62bd87c2728261de67e3d3c3"
/// StudentId : 156454
/// Name : "xyz"
/// Address : "kalol"
/// __v : 0

StudentModel studentModelFromJson(String str) => StudentModel.fromJson(json.decode(str));
String studentModelToJson(StudentModel data) => json.encode(data.toJson());
class StudentModel {
  StudentModel({
      this.fees, 
      this.result, 
      this.id, 
      this.studentId, 
      this.name, 
      this.address, 
      this.v,});

  StudentModel.fromJson(dynamic json) {
    fees = json['Fees'] != null ? Fees.fromJson(json['Fees']) : null;
    result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
    id = json['_id'];
    studentId = json['StudentId'];
    name = json['Name'];
    address = json['Address'];
    v = json['__v'];
  }
  Fees? fees;
  Result? result;
  String? id;
  int? studentId;
  String? name;
  String? address;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (fees != null) {
      map['Fees'] = fees?.toJson();
    }
    if (result != null) {
      map['Result'] = result?.toJson();
    }
    map['_id'] = id;
    map['StudentId'] = studentId;
    map['Name'] = name;
    map['Address'] = address;
    map['__v'] = v;
    return map;
  }

}

/// Hindi : 80
/// Eng : 80
/// Math : 60
/// Total : 55.487
/// Grade : "A"

Result resultFromJson(String str) => Result.fromJson(json.decode(str));
String resultToJson(Result data) => json.encode(data.toJson());
class Result {
  Result({
      this.hindi, 
      this.eng, 
      this.math, 
      this.total, 
      this.grade,});

  Result.fromJson(dynamic json) {
    hindi = json['Hindi'];
    eng = json['Eng'];
    math = json['Math'];
    total = json['Total'];
    grade = json['Grade'];
  }
  int? hindi;
  int? eng;
  int? math;
  double? total;
  String? grade;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Hindi'] = hindi;
    map['Eng'] = eng;
    map['Math'] = math;
    map['Total'] = total;
    map['Grade'] = grade;
    return map;
  }

}

/// Amount : 10000
/// Status : "false"

Fees feesFromJson(String str) => Fees.fromJson(json.decode(str));
String feesToJson(Fees data) => json.encode(data.toJson());
class Fees {
  Fees({
      this.amount, 
      this.status,});

  Fees.fromJson(dynamic json) {
    amount = json['Amount'];
    status = json['Status'];
  }
  int? amount;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Amount'] = amount;
    map['Status'] = status;
    return map;
  }

}