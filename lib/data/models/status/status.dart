import 'package:talants_valley_community/data/models/user/user_model.dart';

class UserData {
  int? statusCode;
  String? status;
  String? message;
  DataAuth? data;

  UserData({this.statusCode, this.status, this.message, this.data});

  UserData.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new DataAuth.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
