// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tourist_places_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TouristPlaceResponse _$TouristPlaceResponseFromJson(
        Map<String, dynamic> json) =>
    TouristPlaceResponse(
      json['id'] as int?,
      json['Region'] as String?,
      json['information'] as String?,
      json['Historical_facts'] as String?,
      json['package_tour_count'] as int?,
      json['main_image'] as String?,
      (json['images'] as List<dynamic>?)
          ?.map((e) => ImagesPlaceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TouristPlaceResponseToJson(
        TouristPlaceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Region': instance.region,
      'information': instance.information,
      'Historical_facts': instance.historicalFacts,
      'package_tour_count': instance.packageTourCount,
      'main_image': instance.mainImage,
      'images': instance.images,
    };

ImagesPlaceResponse _$ImagesPlaceResponseFromJson(Map<String, dynamic> json) =>
    ImagesPlaceResponse(
      json['is_video'] as bool?,
      json['size'] as int?,
      json['url'] as String?,
    );

Map<String, dynamic> _$ImagesPlaceResponseToJson(
        ImagesPlaceResponse instance) =>
    <String, dynamic>{
      'is_video': instance.isVideo,
      'size': instance.size,
      'url': instance.image,
    };
