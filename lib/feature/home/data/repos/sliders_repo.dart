import 'package:tourist_tour_app/core/networking/api_response.dart';
import 'package:tourist_tour_app/core/networking/api_service.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/sliders_response.dart';

class HomeRepo{
  final ApiService _apiService;

  HomeRepo(this._apiService);
  Future<ApiResponse<List<SlidersResponse>>?> getSliders()async{
    try {
      final response = await _apiService.getSliders();
      return response;
    } catch (error) {
      print('error repo');
      return null;
    }
  }
  Future<ApiResponse<List<ProgramResponse>>?> getPrograms()async{
    try {
      final response = await _apiService.getPrograms();
      return response;
    } catch (error) {
      print('error repo');
      return null;
    }
  }
}