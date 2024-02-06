import 'package:freezed_annotation/freezed_annotation.dart';

part 'sliders_response.g.dart';

@JsonSerializable()
class SlidersResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'url')
  String? image;
  SlidersResponse(this.id, this.image);

  factory SlidersResponse.fromJson(Map<String, dynamic> json) =>
      _$SlidersResponseFromJson(json);

}

