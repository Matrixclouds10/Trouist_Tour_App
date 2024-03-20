import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_request.g.dart';
@JsonSerializable()
class SearchRequest{
  @JsonKey(name: 'search')
  final String? search;
  SearchRequest(this.search);
  Map<String, dynamic> toJson() => _$SearchRequestToJson(this);
}