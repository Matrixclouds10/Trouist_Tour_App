import 'package:freezed_annotation/freezed_annotation.dart';
part 'history_response.g.dart';
@JsonSerializable()
class HistoryResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'tourists_type')
  String? touristsType;
  @JsonKey(name: 'family_members')
  int? familyMembers;
  @JsonKey(name: 'age_range')
  String? ageRange;
  @JsonKey(name: 'friends_members')
  int? friendsMembers;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'arival_method')
  String? arivalMethod;
  @JsonKey(name: 'place_of_residence')
  String? placeResidence;
  @JsonKey(name: 'place_name')
  String? placeName;
  @JsonKey(name: 'tour_program_details')
  String? tourProgramDetails;
@JsonKey(name: 'created_at')
  String? createdAt;


  HistoryResponse(
      this.id,
      this.touristsType,
      this.familyMembers,
      this.ageRange,
      this.friendsMembers,
      this.gender,
      this.arivalMethod,
      this.placeResidence,
      this.placeName,
      this.tourProgramDetails,
      this.createdAt);

  factory HistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryResponseFromJson(json);
}