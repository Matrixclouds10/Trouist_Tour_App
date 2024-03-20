
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tourist_tour_app/core/networking/api_error_handler.dart';
import 'package:tourist_tour_app/core/networking/api_response.dart';
import 'package:tourist_tour_app/core/networking/api_result.dart';
import 'package:tourist_tour_app/core/networking/api_service.dart';
import 'package:tourist_tour_app/core/services/logger.dart';
import 'package:tourist_tour_app/feature/make_program/data/models/get_places_response.dart';
import 'package:tourist_tour_app/feature/make_program/data/models/make_program_request.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_dialog.dart';

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
  Future<ApiResult<ApiResponse>?> makeProgram(String token,MakeProgramRequest makeProgramRequest,context) async {
    try {
      final response = await _apiService.makeProgram(token,makeProgramRequest);
      log('makeProgram Response Success: ',"$response");

      return ApiResult.success(response);
    } catch (error) {
      log('makeProgram Response Error : ',"$error");
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }




}