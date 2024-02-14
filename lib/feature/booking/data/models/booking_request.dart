import 'package:freezed_annotation/freezed_annotation.dart';
part 'booking_request.g.dart';
@JsonSerializable()
class BookingRequest{
  @JsonKey(name: 'tour_program_id')
  final int? id;
  @JsonKey(name: 'notes')
  final String? notes;
  @JsonKey(name: 'payment')
  final String? payment;
  @JsonKey(name: 'total')
  final int? total;

  BookingRequest({required this.id,required this.notes,required this.payment,required this.total});
  Map<String, dynamic> toJson() => _$BookingRequestToJson(this);
}