import 'package:tourist_tour_app/core/networking/api_response.dart';
import 'package:tourist_tour_app/core/networking/api_service.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';

class FavoriteRepo {
  final ApiService _apiService;
  FavoriteRepo(this._apiService);
  Future<ApiResponse> addFavoriteProgram(int? id, String? token)async{
    try {
      final response = await _apiService.addFavoriteProgram(id!, token!);
      return response;
    } catch (error) {
      print('error repo');
      throw error.toString();
    }
  }
  Future<ApiResponse<List<ProgramResponse>>> getFavoriteProgram( String? token,String? language)async{
    try {
      final response = await _apiService.getFavoriteProgram(token!,language!);
      return response;
    } catch (error) {
      print('error repo');
      throw error.toString();
    }
  }
}