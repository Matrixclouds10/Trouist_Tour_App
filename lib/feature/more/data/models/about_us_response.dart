import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_us_response.g.dart';

@JsonSerializable()
class AboutUsResponse{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'image')
  String? image;

  AboutUsResponse(this.id, this.name, this.description, this.image);
   factory AboutUsResponse.fromJson(Map<String,dynamic> json)=>
       _$AboutUsResponseFromJson(json);
}