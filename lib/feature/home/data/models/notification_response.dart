import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_response.g.dart';

@JsonSerializable()
class NotificationResponse{
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'id_increment')
  int? inId;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'notifiable_type')
  String? notifiableType;
 @JsonKey(name: 'notifiable_id')
  int? notifiableId;
  @JsonKey(name: 'created_at')
  String? createdAt;
 @JsonKey(name: 'updated_at')
  String? updatedAt;
@JsonKey(name: 'data')
NotificationDataResponse? data;

  NotificationResponse(this.id, this.inId, this.type, this.notifiableType,
      this.notifiableId, this.createdAt, this.updatedAt, this.data);

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);

}

@JsonSerializable()
class NotificationDataResponse {
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'role')
  String? role;


  NotificationDataResponse(this.title, this.message, this.role);

  factory NotificationDataResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataResponseFromJson(json);

}

