import 'package:json_annotation/json_annotation.dart';
import 'package:tourist_tour_app/core/networking/pagination.dart';
part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  @JsonKey(name: 'status')
  bool? status;
  @JsonKey(name: 'code')
  int? code;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'data')
  T? data;
  @JsonKey(name: 'pagination')
  Pagination? pagination;


  ApiResponse({this.code, this.message, this.data, this.pagination, bool? status});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) toJsonT,
  ) => _$ApiResponseFromJson(json, toJsonT);
}



