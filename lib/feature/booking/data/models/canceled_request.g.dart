// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'canceled_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CanceledRequest _$CanceledRequestFromJson(Map<String, dynamic> json) =>
    CanceledRequest(
      id: json['booking_id'] as int?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$CanceledRequestToJson(CanceledRequest instance) =>
    <String, dynamic>{
      'booking_id': instance.id,
      'notes': instance.notes,
    };
