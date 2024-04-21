// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgramResponse _$ProgramResponseFromJson(Map<String, dynamic> json) =>
    ProgramResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['region'] as String?,
      json['description'] as String?,
      json['duration'] as String?,
      json['start_date'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['group_size'] as int?,
      json['group_type'] as String?,
      (json['tour_route'] as List<dynamic>?)
          ?.map((e) => TourRouteResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['departure'] as String?,
      json['departure_time'] as String?,
      json['return_time'] as String?,
      (json['price_includes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['is_favourite'] as bool?,
      json['discount_amount'] as String?,
      (json['new_price'] as num?)?.toDouble(),
      json['discount_percentage'] as String?,
      json['main_image'] as String?,
      (json['images'] as List<dynamic>?)
          ?.map((e) => ImagesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['is_booked'] as bool?,
      json['end_date'] as String?,
      json['overview'] as String?,
    );

Map<String, dynamic> _$ProgramResponseToJson(ProgramResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'region': instance.region,
      'description': instance.description,
      'duration': instance.duration,
      'start_date': instance.startDate,
      'price': instance.price,
      'group_size': instance.groupSize,
      'group_type': instance.groupType,
      'tour_route': instance.tourRoute,
      'departure': instance.departure,
      'overview': instance.overview,
      'departure_time': instance.departureTime,
      'return_time': instance.returnTime,
      'price_includes': instance.priceIncludes,
      'discount_amount': instance.discountAmount,
      'discount_percentage': instance.discountPercentage,
      'main_image': instance.mainImage,
      'is_favourite': instance.isFav,
      'new_price': instance.newPrice,
      'images': instance.images,
      'is_booked': instance.isBooked,
      'end_date': instance.endDate,
    };

ImagesResponse _$ImagesResponseFromJson(Map<String, dynamic> json) =>
    ImagesResponse(
      json['is_video'] as bool?,
      json['size'] as int?,
      json['url'] as String?,
    );

Map<String, dynamic> _$ImagesResponseToJson(ImagesResponse instance) =>
    <String, dynamic>{
      'is_video': instance.isVideo,
      'size': instance.size,
      'url': instance.image,
    };

TourRouteResponse _$TourRouteResponseFromJson(Map<String, dynamic> json) =>
    TourRouteResponse(
      json['key'],
      json['value'] as String?,
    );

Map<String, dynamic> _$TourRouteResponseToJson(TourRouteResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };
