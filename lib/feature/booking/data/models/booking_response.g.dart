// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingResponse _$BookingResponseFromJson(Map<String, dynamic> json) =>
    BookingResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['region'] as String?,
      json['description'] as String?,
      json['duration'] as String?,
      json['start_date'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['group_size'] as int?,
      json['rate'] as int?,
      json['group_type'] as String?,
      (json['tour_route'] as List<dynamic>?)
          ?.map((e) =>
              TourRouteBookingResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['departure'] as String?,
      json['departure_time'] as String?,
      json['return_time'] as String?,
      (json['price_includes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['is_favourite'] as bool?,
      json['booking_id'] as int?,
      json['notes'] as String?,
      json['discount_amount'] as String?,
      (json['new_price'] as num?)?.toDouble(),
      json['discount_percentage'] as String?,
      json['main_image'] as String?,
      (json['images'] as List<dynamic>?)
          ?.map(
              (e) => ImagesBookingResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['end_date'] as String?,
      json['payment_status'] as String?,
    );

Map<String, dynamic> _$BookingResponseToJson(BookingResponse instance) =>
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
      'departure_time': instance.departureTime,
      'return_time': instance.returnTime,
      'price_includes': instance.priceIncludes,
      'discount_amount': instance.discountAmount,
      'discount_percentage': instance.discountPercentage,
      'main_image': instance.mainImage,
      'notes': instance.note,
      'rate': instance.rate,
      'is_favourite': instance.isFav,
      'new_price': instance.newPrice,
      'booking_id': instance.bookingId,
      'images': instance.images,
      'end_date': instance.endDate,
      'payment_status': instance.paymentStatus,
    };

ImagesBookingResponse _$ImagesBookingResponseFromJson(
        Map<String, dynamic> json) =>
    ImagesBookingResponse(
      json['is_video'] as bool?,
      json['size'] as int?,
      json['url'] as String?,
    );

Map<String, dynamic> _$ImagesBookingResponseToJson(
        ImagesBookingResponse instance) =>
    <String, dynamic>{
      'is_video': instance.isVideo,
      'size': instance.size,
      'url': instance.image,
    };

TourRouteBookingResponse _$TourRouteBookingResponseFromJson(
        Map<String, dynamic> json) =>
    TourRouteBookingResponse(
      json['key'],
      json['value'] as String?,
    );

Map<String, dynamic> _$TourRouteBookingResponseToJson(
        TourRouteBookingResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };
