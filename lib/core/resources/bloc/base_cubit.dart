import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/networking/api_response.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';


abstract class BaseCubit extends Cubit<DataState>{
  BaseCubit() : super(UnInitState());

  executeSuccess<T>(Future<T> Function() invoke) async {
    try {
      emit(DataLoading());
      final response = await invoke();
      emit(DataSuccess<T>(response));
    }
    catch (e) {
      emit(DataFailed(e));
      rethrow;
    }
  }
  executeSuccessNotLoading<T>(Future<T> Function() invoke) async {
    try {
     // emit(DataLoading());
      final response = await invoke();
      emit(DataSuccess<T>(response));
    } catch (e) {
      emit(DataFailed(e));
      rethrow;
    }
  }
  executeBuilder<T>(Future<T> Function() invoke,
      {bool isRefresh = true, required ValueChanged<T> onSuccess , ValueChanged ? onError}) async {
    try {
      if(isRefresh){
        emit(DataLoading());
      }
      final response = await invoke();
      onSuccess(response);
    }
    catch (e) {
      if(onError!=null){
        onError(e);
      }
      else {
        emit(DataFailed(e));
      }
    }
  }
  executeListener<T>(Future<T> Function() invoke,
      {required ValueChanged<T> onSuccess}) async {
    try {
      emit(LoadingStateListener());
      final response = await invoke();
      onSuccess(response);
    } catch (e) {
      print(e);
      emit(FailureStateListener(e));
    }
  }

  executeEmitterListener(Future<dynamic> Function() invoke) {
    executeListener(() => invoke(), onSuccess: (v) {
      emit((SuccessStateListener(v.toString())));
    });
  }

  executeEmitterData(Future<ApiResponse> Function() invoke) {
    executeListener(() => invoke(), onSuccess: (v) {
      emit(DataSuccess(v));
    });
  }
}