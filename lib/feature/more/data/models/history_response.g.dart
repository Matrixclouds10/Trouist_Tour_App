// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryResponse _$HistoryResponseFromJson(Map<String, dynamic> json) =>
    HistoryResponse(
      json['id'] as int?,
      json['tourists_type'] as String?,
      json['family_members'] as int?,
      json['age_range'] as String?,
      json['friends_members'] as int?,
      json['gender'] as String?,
      json['arival_method'] as String?,
      json['place_of_residence'] as String?,
      json['place_name'] as String?,
      json['tour_program_details'] as String?,
      json['created_at'] as String?,
    );

Map<String, dynamic> _$HistoryResponseToJson(HistoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tourists_type': instance.touristsType,
      'family_members': instance.familyMembers,
      'age_range': instance.ageRange,
      'friends_members': instance.friendsMembers,
      'gender': instance.gender,
      'arival_method': instance.arivalMethod,
      'place_of_residence': instance.placeResidence,
      'place_name': instance.placeName,
      'tour_program_details': instance.tourProgramDetails,
      'created_at': instance.createdAt,
    };
