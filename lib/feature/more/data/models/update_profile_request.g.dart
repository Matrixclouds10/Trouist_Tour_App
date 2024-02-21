// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequest _$UpdateProfileRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileRequest(
      name: json['full_name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      countryId: json['country_id'] as int,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$UpdateProfileRequestToJson(
        UpdateProfileRequest instance) =>
    <String, dynamic>{
      'full_name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'country_id': instance.countryId,
      'image': instance.image,
    };
