import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tourist_tour_app/core/networking/api_response.dart';
import 'package:tourist_tour_app/core/networking/api_service.dart';
import 'package:tourist_tour_app/feature/make_program/data/models/get_places_response.dart';
import 'package:tourist_tour_app/feature/make_program/data/models/make_program_request.dart';

class MakeProgramRepo{
  final ApiService _apiService;
  MakeProgramRepo(this._apiService);
  Future<ApiResponse<GetPlacesResponse>?> places(String token) async {
    try {
      final response = await _apiService.places(token);
      return response;
    } on DioError catch (e)  {
      debugPrint(e.toString());
    }
    return null;
  }
  Future<ApiResponse?> makeProgram(String token,MakeProgramRequest makeProgramRequest) async {
    try {
      final response = await _apiService.makeProgram(token,makeProgramRequest);
      return response;
    } on DioError catch (e)  {
      debugPrint(e.toString());
    }
    return null;
  }

}