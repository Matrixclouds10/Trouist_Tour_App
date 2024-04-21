// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentRequest _$PaymentRequestFromJson(Map<String, dynamic> json) =>
    PaymentRequest(
      paymentId: json['PaymentId'] as String?,
      tourId: json['tour_id'] as String?,
      userId: json['user_id'] as String?,
      amount: json['amount'] as String?,
      paymentType: json['PaymentType'] as String?,
      result: json['Result'] as String?,
    );

Map<String, dynamic> _$PaymentRequestToJson(PaymentRequest instance) =>
    <String, dynamic>{
      'PaymentId': instance.paymentId,
      'tour_id': instance.tourId,
      'user_id': instance.userId,
      'amount': instance.amount,
      'PaymentType': instance.paymentType,
      'Result': instance.result,
    };
