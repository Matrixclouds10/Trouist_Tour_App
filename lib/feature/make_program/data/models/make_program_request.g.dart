// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_program_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeProgramRequest _$MakeProgramRequestFromJson(Map<String, dynamic> json) =>
    MakeProgramRequest(
      json['tourists_type'] as String?,
      json['family_members'] as String?,
      json['age_range'] as String?,
      json['friends_members'] as String?,
      json['gender'] as String?,
      json['arival_method'] as String?,
      json['place_of_residence'] as String?,
      json['resort_name'] as String?,
      json['inn_name'] as String?,
      json['hotel_name_4star'] as String?,
      json['hotel_name_5star'] as String?,
      json['tour_program'] as String?,
    );

Map<String, dynamic> _$MakeProgramRequestToJson(MakeProgramRequest instance) =>
    <String, dynamic>{
      'tourists_type': instance.type,
      'family_members': instance.familyMembers,
      'age_range': instance.ageRange,
      'friends_members': instance.friendsMembers,
      'gender': instance.gender,
      'arival_method': instance.arivalMethod,
      'place_of_residence': instance.placeResidence,
      'resort_name': instance.resortName,
      'inn_name': instance.innName,
      'hotel_name_4star': instance.hotel4Star,
      'hotel_name_5star': instance.hotel5Star,
      'tour_program': instance.tourProgram,
    };
