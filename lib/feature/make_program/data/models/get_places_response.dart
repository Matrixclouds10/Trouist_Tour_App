import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tourist_tour_app/core/networking/api_response.dart';
import 'package:tourist_tour_app/core/networking/pagination.dart';
part 'get_places_response.g.dart';

@JsonSerializable()
class GetPlacesResponse{
  @JsonKey(name: 'Hotels')
  List<HotelsResponse>? hotels;
  @JsonKey(name: 'Resorts')
  List<HotelsResponse>? resorts;
   @JsonKey(name: 'Inns')
  List<HotelsResponse>? inns;

  GetPlacesResponse(this.hotels, this.resorts, this.inns);
  factory GetPlacesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPlacesResponseFromJson(json);
}

@JsonSerializable()
class HotelsResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  HotelsResponse(this.id, this.name, this.type, this.createdAt, this.updatedAt);

  factory HotelsResponse.fromJson(Map<String, dynamic> json) =>
      _$HotelsResponseFromJson(json);

}