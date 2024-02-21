import 'package:freezed_annotation/freezed_annotation.dart';
part 'booking_response.g.dart';
@JsonSerializable()
class BookingResponse{
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
  List<TourRouteBookingResponse>? tourRoute;
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
  @JsonKey(name: 'is_favourite')
  bool? isFav;
  @JsonKey(name: 'new_price')
  int? newPrice;
  @JsonKey(name: 'booking_id')
  int? bookingId;
  @JsonKey(name: 'images')
  List<ImagesBookingResponse>? images;


  BookingResponse(
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
      this.isFav,
      this.bookingId,
      this.discountAmount,
      this.newPrice,
      this.discountPercentage,
      this.mainImage,
      this.images); // ProgramResponse(

  factory BookingResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingResponseFromJson(json);

}

@JsonSerializable()
class ImagesBookingResponse {
  @JsonKey(name: 'is_video')
  bool? isVideo;
  @JsonKey(name: 'size')
  int? size;
  @JsonKey(name: 'url')
  String? image;
  ImagesBookingResponse(this.isVideo, this.size, this.image);

  factory ImagesBookingResponse.fromJson(Map<String, dynamic> json) =>
      _$ImagesBookingResponseFromJson(json);

}
@JsonSerializable()
class TourRouteBookingResponse {
  dynamic key;
  String? value;

  TourRouteBookingResponse(this.key, this.value);

  factory TourRouteBookingResponse.fromJson(Map<String, dynamic> json) =>
      _$TourRouteBookingResponseFromJson(json);

}
