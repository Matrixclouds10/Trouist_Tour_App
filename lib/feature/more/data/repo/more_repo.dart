import 'package:tourist_tour_app/core/networking/api_response.dart';
import 'package:tourist_tour_app/core/networking/api_service.dart';
import 'package:tourist_tour_app/feature/more/data/models/about_us_response.dart';
import 'package:tourist_tour_app/feature/more/data/models/profile_response.dart';
import 'package:tourist_tour_app/feature/more/data/models/update_profile_request.dart';

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
  Future<ApiResponse<ProfileResponse>?> getProfile(String token)async{
    try {
      final response = await _apiService.getProfile(token);
      return response;
    } catch (error) {
      return null;
    }
  }

  Future<ApiResponse?> updateProfile(String token ,UpdateProfileRequest updateProfileRequest)async{
    try {
      final response = await _apiService.updateProfile(token,updateProfileRequest);
      return response;
    } catch (error) {
      return null;
    }
  }
}