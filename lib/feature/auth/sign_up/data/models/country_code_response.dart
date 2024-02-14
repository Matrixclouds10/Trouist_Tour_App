import 'package:freezed_annotation/freezed_annotation.dart';
part 'country_code_response.g.dart';

@JsonSerializable()
class CountryResponse{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;

  CountryResponse(this.id, this.name);
  factory CountryResponse.fromJson(Map<String, dynamic> json) =>
      _$CountryResponseFromJson(json);
}