// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationResponse _$NotificationResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationResponse(
      json['id'] as String?,
      json['id_increment'] as int?,
      json['type'] as String?,
      json['notifiable_type'] as String?,
      json['notifiable_id'] as int?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['data'] == null
          ? null
          : NotificationDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationResponseToJson(
        NotificationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_increment': instance.inId,
      'type': instance.type,
      'notifiable_type': instance.notifiableType,
      'notifiable_id': instance.notifiableId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'data': instance.data,
    };

NotificationDataResponse _$NotificationDataResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationDataResponse(
      json['title'] as String?,
      json['message'] as String?,
      json['role'] as String?,
    );

Map<String, dynamic> _$NotificationDataResponseToJson(
        NotificationDataResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'role': instance.role,
    };
