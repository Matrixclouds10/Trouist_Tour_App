// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingRequest _$BookingRequestFromJson(Map<String, dynamic> json) =>
    BookingRequest(
      id: json['tour_program_id'] as int?,
      notes: json['notes'] as String?,
      payment: json['payment'] as String?,
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BookingRequestToJson(BookingRequest instance) =>
    <String, dynamic>{
      'tour_program_id': instance.id,
      'notes': instance.notes,
      'payment': instance.payment,
      'total': instance.total,
    };
