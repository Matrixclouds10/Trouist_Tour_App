class UrWayResponse {
  String? paymentId;
  String? tranId;
  String? eCI;
  String? result;
  String? trackId;
  String? authCode;
  String? responseCode;
  String? rRN;
  String? responseHash;
  String? cardBrand;
  String? amount;
  String? userField1;
  String? userField3;
  String? userField4;
  String? userField5;
  String? cardToken;
  String? maskedPAN;
  String? email;
  String? payFor;
  String? subscriptionId;
  String? paymentType;
  String? metaData;

  UrWayResponse(
      {this.paymentId,
        this.tranId,
        this.eCI,
        this.result,
        this.trackId,
        this.authCode,
        this.responseCode,
        this.rRN,
        this.responseHash,
        this.cardBrand,
        this.amount,
        this.userField1,
        this.userField3,
        this.userField4,
        this.userField5,
        this.cardToken,
        this.maskedPAN,
        this.email,
        this.payFor,
        this.subscriptionId,
        this.paymentType,
        this.metaData});

  UrWayResponse.fromJson(Map<String, dynamic> json) {
    paymentId = json['PaymentId'];
    tranId = json['TranId'];
    eCI = json['ECI'];
    result = json['Result'];
    trackId = json['TrackId'];
    authCode = json['AuthCode'];
    responseCode = json['ResponseCode'];
    rRN = json['RRN'];
    responseHash = json['responseHash'];
    cardBrand = json['cardBrand'];
    amount = json['amount'];
    userField1 = json['UserField1'];
    userField3 = json['UserField3'];
    userField4 = json['UserField4'];
    userField5 = json['UserField5'];
    cardToken = json['cardToken'];
    maskedPAN = json['maskedPAN'];
    email = json['email'];
    payFor = json['payFor'];
    subscriptionId = json['SubscriptionId'];
    paymentType = json['PaymentType'];
    metaData = json['metaData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PaymentId'] = paymentId;
    data['TranId'] = tranId;
    data['ECI'] = eCI;
    data['Result'] = result;
    data['TrackId'] = trackId;
    data['AuthCode'] = authCode;
    data['ResponseCode'] = responseCode;
    data['RRN'] = rRN;
    data['responseHash'] = responseHash;
    data['cardBrand'] = cardBrand;
    data['amount'] = amount;
    data['UserField1'] = userField1;
    data['UserField3'] = userField3;
    data['UserField4'] = userField4;
    data['UserField5'] = userField5;
    data['cardToken'] = cardToken;
    data['maskedPAN'] = maskedPAN;
    data['email'] = email;
    data['payFor'] = payFor;
    data['SubscriptionId'] = subscriptionId;
    data['PaymentType'] = paymentType;
    data['metaData'] = metaData;
    return data;
  }
}
