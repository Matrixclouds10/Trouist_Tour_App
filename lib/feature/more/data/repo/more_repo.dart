import 'package:tourist_tour_app/core/networking/api_response.dart';
import 'package:tourist_tour_app/core/networking/api_service.dart';
import 'package:tourist_tour_app/feature/more/data/models/about_us_response.dart';

class MoreRepo{
  final ApiService _apiService;
  MoreRepo(this._apiService);
  Future<ApiResponse<AboutUsResponse>?> getAboutUs(String language)async{
    try {

      final response = await _apiService.getAboutUs(language);
      return response;
    } catch (error) {
      return null;
    }
  }
  Future<ApiResponse<AboutUsResponse>?> getTermsApp(String language)async{
    try {
      final response = await _apiService.getTermsApp(language);
      return response;
    } catch (error) {
      return null;
    }
  }
  Future<ApiResponse<AboutUsResponse>?> getPrivacy(String language)async{
    try {
      final response = await _apiService.getPrivacy(language);
      return response;
    } catch (error) {
      return null;
    }
  }
}