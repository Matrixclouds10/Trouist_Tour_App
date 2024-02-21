import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/toast_states/enums.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/booking/data/models/booking_request.dart';
import 'package:tourist_tour_app/feature/booking/data/models/booking_response.dart';
import 'package:tourist_tour_app/feature/booking/data/models/canceled_request.dart';
import 'package:tourist_tour_app/feature/booking/data/repo/booking_repo.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/feature/root_pages/root_page.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_dialog.dart';
part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final BookingRepo _bookingRepo;
  BookingCubit(this._bookingRepo): super(BookingInitial());
  static BookingCubit get(BuildContext context)=>BlocProvider.of(context);
  List<BookingResponse>? getBookingProgramsList;
  List<BookingResponse>? getCanceledProgramsList;
  TextEditingController noteController= TextEditingController();
  String valueCanceled='button_sheet_body1'.tr();
  void putValueCanceled(String x){
    valueCanceled =x;
    emit(PutState());
  }
  void getBookingPrograms(String token ,BuildContext context,String? language) async {
    getBookingProgramsList=null;
    try{
      final response = await _bookingRepo.getBookingPrograms('Bearer $token',language!);
      if(response.status==true){
        getBookingProgramsList=response.data!;
        emit(GetBookingProgramsState());
      }
    }catch(e){
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast('$e', ToastStates.error, context);
      });
      emit(GetBookingProgramsErrorState());
    }
  }
  void getCanceledPrograms(String token ,BuildContext context,String? language) async {
    try{
      final response = await _bookingRepo.getCanceledPrograms('Bearer $token',language!);
      if(response.status==true){
        getCanceledProgramsList=response.data!;
        emit(GetCanceledProgramsSuccessState());
      }
    }catch(e){
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast('$e', ToastStates.error, context);
      });
      emit(GetCanceledProgramsErrorState());
    }
  }

  void bookingPrograms(BookingRequest bookingRequest,BuildContext context) async {
    try{
      final response = await _bookingRepo.bookingPrograms('Bearer ${HomeCubit.get(context).token}',bookingRequest);
      if(response!.status==true){
        Future.delayed(const Duration(microseconds: 0)).then((value) {
          getBookingPrograms(HomeCubit.get(context).token!,context,context.locale.toString());
          showToast('${response.message}', ToastStates.success, context);
          showCustomDialog2(
              title:'success'.tr(),
              des:response.message,
              bt1: AppImages.dialog,bt2:  'ok'.tr(),
              onPressed1: (){
                NavigatePages.pushReplacePage(RootPages(check: '3',), context);
              },
              context: context);
        });
        emit(BookingProgramsSuccessState());
      }
    }catch(e){
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast('$e', ToastStates.error, context);
      });
      emit(BookingProgramsErrorState());
    }
  }
  void cancelingProgram(CanceledRequest canceledRequest,BuildContext context) async {
    try{
      final response = await _bookingRepo.cancelingProgram('Bearer ${HomeCubit.get(context).token}',canceledRequest);
      if(response!.status==true){
        Future.delayed(const Duration(microseconds: 0)).then((value) {
          getBookingPrograms(HomeCubit.get(context).token!,context,context.locale.toString());
          getCanceledPrograms(HomeCubit.get(context).token!,context,context.locale.toString());
          showToast('${response.message}', ToastStates.success, context);
          Navigator.of(context).pop();
          noteController.text='';
        });
        emit(BookingProgramsSuccessState());
      }
    }catch(e){
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast('$e', ToastStates.error, context);
      });
      emit(BookingProgramsErrorState());
    }
  }

}
