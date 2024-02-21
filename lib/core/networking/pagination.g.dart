// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      currentPage: json['current_page'] as int?,
      totalPages: json['total_pages'] as int?,
      perPage: json['per_page'] as int?,
      totalItems: json['total_items'] as int?,
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'total_pages': instance.totalPages,
      'per_page': instance.perPage,
      'total_items': instance.totalItems,
    };
