
import 'package:tourist_tour_app/core/networking/api_error_handler.dart';
import 'package:tourist_tour_app/core/networking/api_response.dart';
import 'package:tourist_tour_app/core/networking/api_result.dart';
import 'package:tourist_tour_app/core/networking/api_service.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/data/models/country_code_response.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/data/models/sign_up_response.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/data/models/terms_response.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  Future<List<CountryResponse>?> getCountryCode(String language) async {
    try {
      final response = await _apiService.getCountryCode(language);
      return response.data!;
    } catch (error) {
      return null;
    }

  }
  Future<TermsResponse?> getTerms(String language) async {
    try {
      final response = await _apiService.getTerms(language);
      return response.data!;
    } catch (error) {
      return null;
    }
  }
}
