// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_places_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPlacesResponse _$GetPlacesResponseFromJson(Map<String, dynamic> json) =>
    GetPlacesResponse(
      (json['Hotels'] as List<dynamic>?)
          ?.map((e) => HotelsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['Resorts'] as List<dynamic>?)
          ?.map((e) => HotelsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['Inns'] as List<dynamic>?)
          ?.map((e) => HotelsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetPlacesResponseToJson(GetPlacesResponse instance) =>
    <String, dynamic>{
      'Hotels': instance.hotels,
      'Resorts': instance.resorts,
      'Inns': instance.inns,
    };

HotelsResponse _$HotelsResponseFromJson(Map<String, dynamic> json) =>
    HotelsResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['type'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
    );

Map<String, dynamic> _$HotelsResponseToJson(HotelsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
