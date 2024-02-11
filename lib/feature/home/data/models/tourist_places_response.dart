import 'package:freezed_annotation/freezed_annotation.dart';
part 'tourist_places_response.g.dart';

@JsonSerializable()
class TouristPlaceResponse{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'Region')
  String? region;
  @JsonKey(name: 'information')
  String? information;
  @JsonKey(name: 'Historical_facts')
  String? historicalFacts;
  @JsonKey(name: 'package_tour_count')
  int? packageTourCount;
  @JsonKey(name: 'main_image')
  String? mainImage;
  @JsonKey(name: 'images')
  List<ImagesPlaceResponse>? images;

  TouristPlaceResponse(this.id, this.region, this.information,
      this.historicalFacts, this.packageTourCount, this.mainImage, this.images);

  factory TouristPlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$TouristPlaceResponseFromJson(json);
}
@JsonSerializable()
class ImagesPlaceResponse {
  @JsonKey(name: 'is_video')
  bool? isVideo;
  @JsonKey(name: 'size')
  int? size;
  @JsonKey(name: 'url')
  String? image;
  ImagesPlaceResponse(this.isVideo, this.size, this.image);

  factory ImagesPlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$ImagesPlaceResponseFromJson(json);

}