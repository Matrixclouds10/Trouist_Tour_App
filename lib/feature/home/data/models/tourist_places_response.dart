import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
part 'tourist_places_response.g.dart';

@JsonSerializable()
class TouristPlaceResponse{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'Region')
  String? region;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'information')
  String? information;
  @JsonKey(name: 'Historical_facts')
  String? historicalFacts;
  @JsonKey(name: 'package_tour_count')
  int? packageTourCount;
  @JsonKey(name: 'main_image')
  String? mainImage;
  @JsonKey(name: 'is_favourite')
  bool? isFav;
  @JsonKey(name: 'images')
  List<ImagesPlaceResponse>? images;
  @JsonKey(name: 'related_programs')
  List<ProgramResponse>? relatedPrograms;

  TouristPlaceResponse(this.id, this.region ,this.title, this.information,
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