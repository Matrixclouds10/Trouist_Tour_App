// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      (json['destinations'] as List<dynamic>?)
          ?.map((e) => TouristPlaceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['programs'] as List<dynamic>?)
          ?.map((e) => ProgramResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'destinations': instance.places,
      'programs': instance.programs,
    };
