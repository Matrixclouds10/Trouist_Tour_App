import 'package:flutter/cupertino.dart';
import 'package:tourist_tour_app/core/networking/api_response.dart';
import 'package:tourist_tour_app/core/networking/api_service.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/search_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/sliders_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/tourist_places_response.dart';

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
      final response = await _apiService.getPrograms(token,language);
      return response;
    } catch (error) {
      debugPrint('error repo');
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
      final response = await _apiService.getTouristPlaces(token ,language);
      return response;
    } catch (error) {
      debugPrint('error repo');
      return null;
    }
  }
  Future<ApiResponse<SearchResponse>?> search(String text,String token ,String language)async{
    try {
      final response = await _apiService.searchPlaces(text,token,language);
      return response;
    } catch (error) {
      debugPrint('error repo');
      return null;
    }
  }
}