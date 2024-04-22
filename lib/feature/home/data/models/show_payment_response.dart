import 'package:freezed_annotation/freezed_annotation.dart';

part 'show_payment_response.g.dart';

@JsonSerializable()
class ShowPaymentResponse{
  @JsonKey(name: 'payment')
  String? payment;

  ShowPaymentResponse(
      this.payment,);

  factory ShowPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$ShowPaymentResponseFromJson(json);

}

