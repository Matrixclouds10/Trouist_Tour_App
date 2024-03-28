import 'package:freezed_annotation/freezed_annotation.dart';
part 'rating_request.g.dart';
@JsonSerializable()
class RatingRequest{
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'tour_program_id')
  final String? programId;
  @JsonKey(name: 'rating')
  final String? rating;
  @JsonKey(name: 'comment')
  final String? comment;
  RatingRequest({required this.userId,required this.programId,required this.rating,required this.comment});
  Map<String, dynamic> toJson() => _$RatingRequestToJson(this);
}