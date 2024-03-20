import 'package:freezed_annotation/freezed_annotation.dart';
part 'payment_request.g.dart';
@JsonSerializable()
class PaymentRequest{
  @JsonKey(name: 'PaymentId')
  final String? paymentId;
  @JsonKey(name: 'tour_id')
  final String? tourId;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'amount')
  final String? amount;
  @JsonKey(name: 'PaymentType')
  final String? paymentType;
  @JsonKey(name: 'Result')
  final String? result;

  PaymentRequest({required this.paymentId,required this.tourId,required this.userId,required this.amount,
    required this.paymentType,required this.result});

  Map<String, dynamic> toJson() => _$PaymentRequestToJson(this);
}