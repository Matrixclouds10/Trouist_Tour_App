class Test {
  int? code;
  bool? status;
  String? message;
  Data? data;

  Test({this.code, this.status, this.message, this.data});

  Test.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? fullName;
  String? email;
  String? phone;
  int? countryId;
  String? token;
  String? fcmToken;

  Data(
      {this.id,
        this.fullName,
        this.email,
        this.phone,
        this.countryId,
        this.token,
        this.fcmToken});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full name'];
    email = json['email'];
    phone = json['phone'];
    countryId = json['country_id'];
    token = json['token'];
    fcmToken = json['fcm_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full name'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['country_id'] = this.countryId;
    data['token'] = this.token;
    data['fcm_token'] = this.fcmToken;
    return data;
  }
}
