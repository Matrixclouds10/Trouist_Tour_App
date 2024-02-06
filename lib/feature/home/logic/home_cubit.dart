import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/resources/bloc/base_cubit.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/sliders_response.dart';
import 'package:tourist_tour_app/feature/home/data/repos/sliders_repo.dart';
part 'home_state.dart';

class HomeCubit extends BaseCubit {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo);
  static HomeCubit get(BuildContext context)=>BlocProvider.of(context);
  List<SlidersResponse>? slidersResponseModel;
  List<ProgramResponse>? programResponseModel;
  void getSliderCubit(BuildContext context) async {
    emit(LoadingStateListener());
   try{
     final response = await _homeRepo.getSliders();
     slidersResponseModel=response!.data!;
     emit(const DataSuccess(''));
   }catch(e){
     emit(FailureStateListener(e));
   }
  }
  void getProgramsCubit(BuildContext context) async {
    emit(LoadingStateListener());
    try{
      final response = await _homeRepo.getPrograms();
      programResponseModel=response!.data!;
      emit(const DataSuccess(''));
    }catch(e){
      emit(FailureStateListener(e));
    }
  }

}
