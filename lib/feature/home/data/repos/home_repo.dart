import 'package:flutter/cupertino.dart';
import 'package:tourist_tour_app/core/networking/api_error_handler.dart';
import 'package:tourist_tour_app/core/networking/api_response.dart';
import 'package:tourist_tour_app/core/networking/api_result.dart';
import 'package:tourist_tour_app/core/networking/api_service.dart';
import 'package:tourist_tour_app/feature/home/data/models/notification_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/search_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/sliders_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/tourist_places_response.dart';
import 'package:tourist_tour_app/core/services/logger.dart';

class HomeRepo{
  final ApiService _apiService;

  HomeRepo(this._apiService);
  Future<ApiResponse<List<SlidersResponse>>?> getSliders()async{
    try {
      final response = await _apiService.getSliders();
      return response;
    } catch (error) {
      debugPrint('error repo');
      return null;
    }
  }
  Future<ApiResponse<List<ProgramResponse>>?> getPrograms(String token ,String language)async{

    try {
      final response = await _apiService.getPrograms('Bearer $token',language);
      log('getPrograms test repo ', response.toString());
      return response;
    } catch (error) {
      log('error repo repo ', error.toString());
      return null;
    }
  }
  Future<ApiResponse<List<ProgramResponse>>?> getOffers(String language)async{
    try {
      final response = await _apiService.getOffers(language);
      return response;
    } catch (error) {
      debugPrint('error repo');
      return null;
    }
  }
  Future<ApiResponse<List<TouristPlaceResponse>>?> getTouristPlaces(String token ,String language)async{
    try {
      final response = await _apiService.getTouristPlaces('Bearer $token' ,language);
      return response;
    } catch (error) {
      debugPrint('error repo');
      return null;
    }
  }
  Future<ApiResponse<SearchResponse>?> search(String text,String token ,String language)async{
    try {


      final response = await _apiService.searchPlaces(text,'Bearer $token',language);
      return response;
    } catch (error) {
      debugPrint('error repo');
      return null;
    }
  }
  Future<ApiResult<ApiResponse<List<NotificationResponse>>>?> getNotification(String token )async{
    try {
      final response = await _apiService.getNotification('Bearer $token');
      log('Notification Response : ',"$response");
      return ApiResult.success(response);
    } catch (error) {
      log('Notification Response Error : ',"$error");
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}