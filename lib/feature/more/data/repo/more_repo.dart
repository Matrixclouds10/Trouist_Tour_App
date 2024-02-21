import 'package:dio/dio.dart';
import 'package:tourist_tour_app/core/global/toast_states/enums.dart';
import 'package:tourist_tour_app/core/networking/api_response.dart';
import 'package:tourist_tour_app/core/networking/api_service.dart';
import 'package:tourist_tour_app/feature/more/data/models/about_us_response.dart';
import 'package:tourist_tour_app/feature/more/data/models/profile_response.dart';
import 'package:tourist_tour_app/feature/more/data/models/update_profile_request.dart';
import 'package:tourist_tour_app/feature/more/logic/more_cubit.dart';

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
  Future<ApiResponse?> deleteProfile(String token)async{
    try {
      final response = await _apiService.deleteProfile(token);
      return response;
    } catch (error) {
      return null;
    }
  }

  Future<dynamic> updateProfile(String token ,UpdateProfileRequest updateProfileRequest,context)async{
    try {
      MoreCubit cubit =MoreCubit.get(context);
      var headers = {
        'Accept': 'application/json',
        'Authorization': token,
      };
      var data =
      cubit.imageFile!=null?
      FormData.fromMap({
        'image': [
          await MultipartFile.fromFile(cubit.imageFile!.path, filename: 'upload')
        ],
        'full_name': updateProfileRequest.name,
        'phone': updateProfileRequest.phone,
        'email': updateProfileRequest.email,
        'country_id': updateProfileRequest.countryId,
        'date_of_birth': '2001-01-22'
      }):
      FormData.fromMap({
        'full_name': updateProfileRequest.name,
        'phone': updateProfileRequest.phone,
        'email': updateProfileRequest.email,
        'country_id': updateProfileRequest.countryId,
        'date_of_birth': '2001-01-22'
      });
      var dio = Dio();
      var response = await dio.request(
        'https://dev05.matrix-clouds.com/Tourist_Tour/public/api/updateProfile',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        showToast('Update Successfully', ToastStates.success, context);

        // showToast(response.data['message'], ToastStates.success, context);
      }
      else {
        showToast(response.data['message'], ToastStates.error, context);
      }
    } catch (error) {
      return null;
    }
  }
}