import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/global/toast_states/enums.dart';
import 'package:tourist_tour_app/core/resources/bloc/base_cubit.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/feature/favorite/data/repo/favorite_repo.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
part 'favorite_state.dart';

class FavoriteCubit extends BaseCubit {
  final FavoriteRepo _favoriteRepo;
  FavoriteCubit(this._favoriteRepo);
  static FavoriteCubit get(BuildContext context)=>BlocProvider.of(context);

  void addFavoriteProgram(int id,String token ,String language,BuildContext context) async {
    emit(LoadingStateListener());
    try{
      final response = await _favoriteRepo.addFavoriteProgram(id,'Bearer $token');
      if(response.status==true){
        Future.delayed(const Duration(microseconds: 0)).then((value) {
          showToast('${response.message}', ToastStates.success, context);
          getFavoriteProgram(token, language,context,);
        });
      }else{
        Future.delayed(const Duration(microseconds: 0)).then((value) {
          showToast('${response.message}', ToastStates.error, context);
        });
      }
      emit(SuccessStateListener(''));
    }catch(e){
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast('$e', ToastStates.error, context);
      });
      emit(FailureStateListener(e));
    }
  }
  List<ProgramResponse>? getFavoriteList;


  void getFavoriteProgram(String token ,String language,BuildContext context) async {
    emit(LoadingStateListener());
    try{
      final response = await _favoriteRepo.getFavoriteProgram('Bearer $token',language);
      if(response.status==true){
        getFavoriteList=response.data!;
        emit(SuccessStateListener(''));
      }
    }catch(e){
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast('$e', ToastStates.error, context);
      });
      emit(FailureStateListener(e));
    }
  }
}
