import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/tourist_places_response.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse{
  @JsonKey(name: 'destinations')
  List<TouristPlaceResponse>? places;
  @JsonKey(name: 'programs')
  List<ProgramResponse>? programs;

  SearchResponse(this.places, this.programs);

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
}