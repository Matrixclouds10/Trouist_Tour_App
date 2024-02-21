import 'package:freezed_annotation/freezed_annotation.dart';
part 'canceled_request.g.dart';
@JsonSerializable()
class CanceledRequest{
  @JsonKey(name: 'booking_id')
  final int? id;
  @JsonKey(name: 'notes')
  final String? notes;

  CanceledRequest({required this.id,required this.notes});
  Map<String, dynamic> toJson() => _$CanceledRequestToJson(this);
}