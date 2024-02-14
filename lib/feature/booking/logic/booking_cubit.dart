import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/global/toast_states/enums.dart';
import 'package:tourist_tour_app/core/resources/bloc/base_cubit.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/feature/booking/data/models/booking_request.dart';
import 'package:tourist_tour_app/feature/booking/data/repo/booking_repo.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
part 'booking_state.dart';

class BookingCubit extends BaseCubit {
  final BookingRepo _bookingRepo;
  BookingCubit(this._bookingRepo);
  static BookingCubit get(BuildContext context)=>BlocProvider.of(context);
  List<ProgramResponse>? getBookingProgramsList;
  List<ProgramResponse>? getCanceledProgramsList;
  TextEditingController noteController= TextEditingController();
  void getBookingPrograms(String token ,BuildContext context,String? language) async {
    emit(LoadingStateListener());
    try{
      final response = await _bookingRepo.getBookingPrograms('Bearer $token',language!);
      if(response.status==true){
        getBookingProgramsList=response.data!;
        emit(SuccessStateListener(''));
      }
    }catch(e){
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast('$e', ToastStates.error, context);
      });
      emit(FailureStateListener(e));
    }
  }
  void getCanceledPrograms(String token ,BuildContext context,String? language) async {
    emit(LoadingStateListener());
    try{
      final response = await _bookingRepo.getCanceledPrograms('Bearer $token',language!);
      if(response.status==true){
        getCanceledProgramsList=response.data!;
        emit(SuccessStateListener(''));
      }
    }catch(e){
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast('$e', ToastStates.error, context);
      });
      emit(FailureStateListener(e));
    }
  }

  void bookingPrograms(BookingRequest bookingRequest,BuildContext context) async {
    print('${bookingRequest.toJson()}');
    emit(LoadingStateListener());
    try{
      final response = await _bookingRepo.bookingPrograms('Bearer ${HomeCubit.get(context).token}',bookingRequest);
      if(response!.status==true){
        Future.delayed(const Duration(microseconds: 0)).then((value) {
          showToast('${response.message}', ToastStates.success, context);
        });
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
