import 'package:freezed_annotation/freezed_annotation.dart';

part 'make_program_request.g.dart';
@JsonSerializable()
class MakeProgramRequest{
  @JsonKey(name: 'tourists_type')
  final String? type;
  @JsonKey(name: 'family_members')
  final String? familyMembers;
  @JsonKey(name: 'age_range')
  final String? ageRange;
  @JsonKey(name: 'friends_members')
  final String? friendsMembers;
  @JsonKey(name: 'gender')
  final String? gender;
  @JsonKey(name: 'arival_method')
  final String? arivalMethod;
  @JsonKey(name: 'place_of_residence')
  final String? placeResidence;
  @JsonKey(name: 'resort_name')
  final String? resortName;
  @JsonKey(name: 'inn_name')
  final String? innName;
  @JsonKey(name: 'hotel_name_4star')
  final String? hotel4Star;
  @JsonKey(name: 'hotel_name_5star')
  final String? hotel5Star;
  @JsonKey(name: 'tour_program')
  final String? tourProgram;


  MakeProgramRequest(
      this.type,
      this.familyMembers,
      this.ageRange,
      this.friendsMembers,
      this.gender,
      this.arivalMethod,
      this.placeResidence,
      this.resortName,
      this.innName,
      this.hotel4Star,
      this.hotel5Star,
      this.tourProgram);

  Map<String, dynamic> toJson() => _$MakeProgramRequestToJson(this);
}