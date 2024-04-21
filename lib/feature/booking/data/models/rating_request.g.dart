// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingRequest _$RatingRequestFromJson(Map<String, dynamic> json) =>
    RatingRequest(
      userId: json['user_id'] as String?,
      programId: json['tour_program_id'] as String?,
      rating: json['rating'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$RatingRequestToJson(RatingRequest instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'tour_program_id': instance.programId,
      'rating': instance.rating,
      'comment': instance.comment,
    };
