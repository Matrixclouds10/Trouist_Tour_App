import 'package:tourist_tour_app/core/networking/api_response.dart';
import 'package:tourist_tour_app/core/networking/api_service.dart';
import 'package:tourist_tour_app/feature/booking/data/models/booking_request.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';

class BookingRepo{
  final ApiService _apiService;
  BookingRepo(this._apiService);
  Future<ApiResponse<List<ProgramResponse>>> getBookingPrograms(String? token,String? language)async{
    try {
      final response = await _apiService.getBookingProgram(token!,language!);
      return response;
    } catch (error) {
      print('error repo');
      throw error.toString();
    }
  }
  Future<ApiResponse<List<ProgramResponse>>> getCanceledPrograms(String? token,String? language)async{
    try {
      final response = await _apiService.getCanceledPrograms(token!,language!);
      return response;
    } catch (error) {
      print('error repo');
      throw error.toString();
    }
  }
  Future<ApiResponse?> bookingPrograms(String? token,BookingRequest bookingRequest)async{
    try {
      final response = await _apiService.bookingPrograms(token!,bookingRequest);
      return response;
    } catch (error) {
      print('error repo');
      throw error.toString();
    }
  }
}