import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:tourist_tour_app/core/global/toast_states/enums.dart';
import 'package:tourist_tour_app/core/networking/api_error_handler.dart';
import 'package:tourist_tour_app/core/networking/api_response.dart';
import 'package:tourist_tour_app/core/networking/api_result.dart';
import 'package:tourist_tour_app/core/networking/api_service.dart';
import 'package:tourist_tour_app/core/services/logger.dart';
import 'package:tourist_tour_app/feature/more/data/models/about_us_response.dart';
import 'package:tourist_tour_app/feature/more/data/models/change_password_request.dart';
import 'package:tourist_tour_app/feature/more/data/models/history_response.dart';
import 'package:tourist_tour_app/feature/more/data/models/profile_response.dart';
import 'package:tourist_tour_app/feature/more/data/models/update_profile_request.dart';
import 'package:tourist_tour_app/feature/more/logic/more_cubit.dart';

import '../../../../core/networking/api_constants.dart';

class MoreRepo {
  final ApiService _apiService;

  MoreRepo(this._apiService);

  Future<ApiResponse<AboutUsResponse>?> getAboutUs(String language) async {
    try {
      final response = await _apiService.getAboutUs(language);
      return response;
    } catch (error) {
      return null;
    }
  }

  Future<ApiResponse<AboutUsResponse>?> getTermsApp(String language) async {
    try {
      final response = await _apiService.getTermsApp(language);
      return response;
    } catch (error) {
      return null;
    }
  }

  Future<ApiResponse<AboutUsResponse>?> getPrivacy(String language) async {
    try {
      final response = await _apiService.getPrivacy(language);
      return response;
    } catch (error) {
      return null;
    }
  }

  Future<ApiResponse<ProfileResponse>?> getProfile(String token) async {
    try {
      final response = await _apiService.getProfile(token);
      return response;
    } catch (error) {
      return null;
    }
  }

  Future<ApiResponse?> deleteProfile(String token) async {
    try {
      final response = await _apiService.deleteProfile(token);
      return response;
    } catch (error) {
      return null;
    }
  }

  Future<ApiResponse?> changePassword(String token,
      ChangePasswordRequest changePasswordRequest) async {
    try {
      final response = await _apiService.changePassword(
          token, changePasswordRequest);
      return response;
    } catch (error) {
      return null;
    }
  }

  Future<ApiResult<ApiResponse<List<HistoryResponse>>>?> getHistory(
      String token,BuildContext context) async {
    try {
      final response = await _apiService.getHistory(context.locale.languageCode.toString(),'Bearer $token');
      log('History Response Successa : ', response.data.toString());
      return ApiResult.success(response);
    } catch (error) {
      log('History Response Error : ', "$error");
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<ApiResponse>?> updateProfile(UpdateProfileRequest updateProfileRequest,String token, context) async {
    try {
      MoreCubit cubit = MoreCubit.get(context);
      var headers = {
        'Accept': 'application/json',
        'Authorization': token,
      };

      var data =
      cubit.imageFile != null ?
      FormData.fromMap({
        'image': [
          await MultipartFile.fromFile(
              cubit.imageFile!.path, filename: 'upload')
        ],
        'full_name': updateProfileRequest.name,
        'phone': updateProfileRequest.phone,
        'email': updateProfileRequest.email,
        'country_id': updateProfileRequest.countryId,
        'date_of_birth': '2001-01-22'
      }) :
      FormData.fromMap({
        'full_name': updateProfileRequest.name,
        'phone': updateProfileRequest.phone,
        'email': updateProfileRequest.email,
        'country_id': updateProfileRequest.countryId,
        'date_of_birth': '2001-01-22'
      });
      var dio = Dio();
      var response = await dio.request(
        '${ApiConstants.apiBaseUrl}updateProfile',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        showToast('Update Successfully', ToastStates.success, context);
      }
      else {
        showToast(response.data['message'], ToastStates.error, context);
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != 200) {
        showToast(e.response!.data["message"].toString(), ToastStates.error, context);
      } else {
        showToast('Error: ${e.message}', ToastStates.error, context);
      }
    } catch (e) {
      showToast('Error: $e', ToastStates.error, context);
    }
    // try {
    //   final response = await _apiService.updateProfile('Bearer $token',name,phone,email,countryId,image);
    //   log('updateProfile Response Successa : ', response!.data.toString());
    //   return ApiResult.success(response!);
    // } catch (error) {
    //   log('updateProfile Response Error : ', "$error");
    //   return ApiResult.failure(ErrorHandler.handle(error));
    // }
  }
}