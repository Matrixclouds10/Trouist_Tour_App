import 'package:json_annotation/json_annotation.dart'; 

part 'pagination.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class Pagination {
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'per_page')
  int? perPage;
  @JsonKey(name: 'total_items')
  int? totalItems;

  Pagination({this.currentPage, this.totalPages, this.perPage, this.totalItems});

   factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

   Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

