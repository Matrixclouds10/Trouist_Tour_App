import 'package:dio/dio.dart';
import 'package:tourist_tour_app/core/global/toast_states/enums.dart';
import 'package:tourist_tour_app/core/networking/api_error_handler.dart';
import 'package:tourist_tour_app/core/networking/api_response.dart';
import 'package:tourist_tour_app/core/networking/api_result.dart';
import 'package:tourist_tour_app/core/networking/api_service.dart';
import 'package:tourist_tour_app/core/services/logger.dart';
import 'package:tourist_tour_app/feature/booking/data/models/booking_request.dart';
import 'package:tourist_tour_app/feature/booking/data/models/booking_response.dart';
import 'package:tourist_tour_app/feature/booking/data/models/canceled_request.dart';
import 'package:tourist_tour_app/feature/booking/data/models/payment_request.dart';

class BookingRepo{
  final ApiService _apiService;
  BookingRepo(this._apiService);
  Future<ApiResponse<List<BookingResponse>>?> getBookingPrograms(String? token,String? language,context)async{
    try {
      final response = await _apiService.getBookingProgram(token!,language!);
      if(response.status=true){
        if(response.code==200){
          return response;
        }else{
          showToast('${response.message}', ToastStates.error, context);
        }
      }
      else{
        showToast('${response.message}', ToastStates.error, context);
      }
      return null;
    } catch (error) {
      throw error.toString();
    }
  }
  Future<ApiResponse<List<BookingResponse>>?> getCompletedPrograms(String? token,String? language,context)async{
    try {
      final response = await _apiService.getCompletedProgram(token!,language!);
      if(response.status=true){
        if(response.code==200){
          return response;
        }else{
          showToast('${response.message}', ToastStates.error, context);
        }
      }
      else{
        showToast('${response.message}', ToastStates.error, context);
      }
      return null;
    } catch (error) {
      throw error.toString();
    }
  }
  Future<ApiResponse<List<BookingResponse>>> getCanceledPrograms(String? token,String? language)async{
    try {
      final response = await _apiService.getCanceledPrograms(token!,language!);
      return response;
    } catch (error) {
      print('error 66666repo');
      throw error.toString();
    }
  }
  Future<ApiResult<ApiResponse>> payment(String token,PaymentRequest paymentRequest,)async{
    try {
      final response = await _apiService.payment('Bearer $token',paymentRequest,);
      log('payment token : ',"Bearer $token");
      log('payment Response : ',"$response");
      return ApiResult.success(response);
    } catch (error) {
      log('payment Response Error : ',"$error");
      return ApiResult.failure(ErrorHandler.handle(error));
    }

  }
  Future<ApiResponse?> bookingPrograms(String? token, BookingRequest bookingRequest, context) async {
    try {
      final response = await _apiService.bookingPrograms(token!, bookingRequest);
      return response;
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != 200) {
        showToast(e.response!.data["message"].toString(), ToastStates.error, context);
      } else {
        showToast('Error: ${e.message}', ToastStates.error, context);
      }
    } catch (e) {
      showToast('Error: $e', ToastStates.error, context);
    }

    return null;
  }
  Future<ApiResponse?> cancelingProgram(String? token,CanceledRequest canceledRequest,context)async{
    try {
      final response = await _apiService.cancelingProgram(token!,canceledRequest);
      return response;
    } on DioError catch (error) {
      showToast('${error.response!.data["message"]}', ToastStates.error, context!);
      throw error.toString();
    }
  }
  Future<ApiResponse?> finishedProgram(String? token,CanceledRequest canceledRequest,context)async{
    try {
      final response = await _apiService.finishedProgram(token!,canceledRequest);
      return response;
    }on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != 200) {
        showToast('${e.response!.data["message"]}', ToastStates.error, context);
      } else {
        showToast('Error: ${e.message}', ToastStates.error, context);
      }
    }
    return null;
  }
}