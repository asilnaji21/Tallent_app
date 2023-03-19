class UserData {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  UserData({this.statusCode, this.status, this.message, this.data});

  UserData.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  String? accessToken;
  String? refreshToken;
  User? user;

  Data({this.accessToken, this.refreshToken, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  int? balance;
  bool? verifiedEmail;
  bool? verifiedMobile;
  VerifiedAddress? verifiedAddress;
  VerifiedAddress? verifiedId;
  int? role;
  Address? address;
  bool? isBlocked;

  User(
      {this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.mobile,
      this.balance,
      this.verifiedEmail,
      this.verifiedMobile,
      this.verifiedAddress,
      this.verifiedId,
      this.role,
      this.address,
      this.isBlocked});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    mobile = json['mobile'];
    balance = json['balance'];
    verifiedEmail = json['verifiedEmail'];
    verifiedMobile = json['verifiedMobile'];
    verifiedAddress = json['verifiedAddress'] != null
        ? new VerifiedAddress.fromJson(json['verifiedAddress'])
        : null;
    verifiedId = json['verifiedId'] != null
        ? new VerifiedAddress.fromJson(json['verifiedId'])
        : null;
    role = json['role'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    isBlocked = json['isBlocked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['balance'] = this.balance;
    data['verifiedEmail'] = this.verifiedEmail;
    data['verifiedMobile'] = this.verifiedMobile;
    if (this.verifiedAddress != null) {
      data['verifiedAddress'] = this.verifiedAddress!.toJson();
    }
    if (this.verifiedId != null) {
      data['verifiedId'] = this.verifiedId!.toJson();
    }
    data['role'] = this.role;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['isBlocked'] = this.isBlocked;
    return data;
  }
}

class VerifiedAddress {
  DisapproveReason? disapproveReason;
  String? status;

  VerifiedAddress({this.disapproveReason, this.status});

  VerifiedAddress.fromJson(Map<String, dynamic> json) {
    disapproveReason = json['disapproveReason'] != null
        ? new DisapproveReason.fromJson(json['disapproveReason'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.disapproveReason != null) {
      data['disapproveReason'] = this.disapproveReason!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class DisapproveReason {
  DisapproveReason.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

class Address {
  String? country;

  Address({this.country});

  Address.fromJson(Map<String, dynamic> json) {
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    return data;
  }
}

class UserInfo {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  int? balance;
  bool? verifiedEmail;
  bool? verifiedMobile;
  VerifiedAddress? verifiedAddress;
  VerifiedAddress? verifiedId;
  int? role;
  Address? address;
  bool? isBlocked;

  UserInfo(
      {this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.mobile,
      this.balance,
      this.verifiedEmail,
      this.verifiedMobile,
      this.verifiedAddress,
      this.verifiedId,
      this.role,
      this.address,
      this.isBlocked});

  UserInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    mobile = json['mobile'];
    balance = json['balance'];
    verifiedEmail = json['verifiedEmail'];
    verifiedMobile = json['verifiedMobile'];
    verifiedAddress = json['verifiedAddress'] != null
        ? new VerifiedAddress.fromJson(json['verifiedAddress'])
        : null;
    verifiedId = json['verifiedId'] != null
        ? new VerifiedAddress.fromJson(json['verifiedId'])
        : null;
    role = json['role'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    isBlocked = json['isBlocked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['balance'] = this.balance;
    data['verifiedEmail'] = this.verifiedEmail;
    data['verifiedMobile'] = this.verifiedMobile;
    if (this.verifiedAddress != null) {
      data['verifiedAddress'] = this.verifiedAddress!.toJson();
    }
    if (this.verifiedId != null) {
      data['verifiedId'] = this.verifiedId!.toJson();
    }
    data['role'] = this.role;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['isBlocked'] = this.isBlocked;
    return data;
  }
}
