
class SignupResponse {
  String? message;
  UserData? userData;
  bool? status;
  int? code;

  SignupResponse({this.message, this.userData, this.status, this.code});

  SignupResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    userData = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}
class UserData {
  int? id;
  String? fullName;
  String? email;
  String? phone;
  String? countryId;
  String? token;
  String? fcmToken;


  UserData(
      {this.id,
        this.fullName,
        this.email,
        this.phone,
        this.countryId,
        this.token,
        this.fcmToken});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full name'];
    email = json['email'];
    phone = json['phone'];
    countryId = json['country_id'];
    token = json['token'];
    fcmToken = json['fcm_token'];
  }
}

