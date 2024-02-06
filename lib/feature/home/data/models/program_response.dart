import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_response.g.dart';

@JsonSerializable()
class ProgramResponse{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'region')
  String? region;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'start_date')
  String? startDate;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'group_size')
  int? groupSize;
  @JsonKey(name: 'group_type')
  String? groupType;
  @JsonKey(name: 'tour_route')
  List<TourRouteResponse>? tourRoute;
  @JsonKey(name: 'departure')
  String? departure;
  @JsonKey(name: 'departure_time')
  String? departureTime;
  @JsonKey(name: 'return_time')
  String? returnTime;
  @JsonKey(name: 'price_includes')
  List<String>? priceIncludes;
  @JsonKey(name: 'discount_amount')
  String? discountAmount;
  @JsonKey(name: 'discount_percentage')
  String? discountPercentage;
  @JsonKey(name: 'main_image')
  String? mainImage;
  @JsonKey(name: 'new_price')
  int? newPrice;
  @JsonKey(name: 'images')
  List<ImagesResponse>? images;


  ProgramResponse(
      this.id,
      this.name,
      this.region,
      this.description,
      this.duration,
      this.startDate,
      this.price,
      this.groupSize,
      this.groupType,
      this.tourRoute,
      this.departure,
      this.departureTime,
      this.returnTime,
      this.priceIncludes,
      this.discountAmount,
      this.newPrice,
      this.discountPercentage,
      this.mainImage,
      this.images); // ProgramResponse(

  factory ProgramResponse.fromJson(Map<String, dynamic> json) =>
      _$ProgramResponseFromJson(json);

}
@JsonSerializable()
class ImagesResponse {
  @JsonKey(name: 'is_video')
  bool? isVideo;
  @JsonKey(name: 'size')
  int? size;
  @JsonKey(name: 'url')
  String? image;
  ImagesResponse(this.isVideo, this.size, this.image);

  factory ImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ImagesResponseFromJson(json);

}
@JsonSerializable()
class TourRouteResponse {
  dynamic key;
  String? value;

  TourRouteResponse(this.key, this.value);

  factory TourRouteResponse.fromJson(Map<String, dynamic> json) =>
      _$TourRouteResponseFromJson(json);

}
