import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/toast_states/enums.dart';
import 'package:tourist_tour_app/core/services/logger.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/booking/data/models/booking_request.dart';
import 'package:tourist_tour_app/feature/booking/data/models/booking_response.dart';
import 'package:tourist_tour_app/feature/booking/data/models/canceled_request.dart';
import 'package:tourist_tour_app/feature/booking/data/models/payment_request.dart';
import 'package:tourist_tour_app/feature/booking/data/models/urway_response.dart';
import 'package:tourist_tour_app/feature/booking/data/repo/booking_repo.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/feature/more/data/models/profile_response.dart';
import 'package:tourist_tour_app/feature/more/logic/more_cubit.dart';
import 'package:tourist_tour_app/feature/root_pages/root_page.dart';
import 'package:tourist_tour_app/main.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_dialog.dart';
import 'package:urwaypayment/urwaypayment.dart';

import '../data/models/rating_request.dart';
import '../presentation/screens/rate_screen.dart';
part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final BookingRepo _bookingRepo;
  BookingCubit(this._bookingRepo): super(BookingInitial());
  double  rate =3;
  static BookingCubit get(BuildContext context)=>BlocProvider.of(context);
  List<BookingResponse>? getBookingProgramsList;
  List<BookingResponse>? getCanceledProgramsList;
  List<BookingResponse>? getCompletedProgramsList;
  TextEditingController noteControllerBooking= TextEditingController();
  TextEditingController noteControllerCanceled= TextEditingController();
  TextEditingController commentController= TextEditingController();
  String valueCanceled='button_sheet_body1'.tr();
  void putValueCanceled(String x){
    valueCanceled =x;
    print(valueCanceled);
    emit(PutState());
  }
  void putRate(double x){
    rate =x;
    emit(PutState());
  }
  void getBookingPrograms(String token ,BuildContext context,String? language) async {
    getBookingProgramsList=null;
    try{
      final response = await _bookingRepo.getBookingPrograms('Bearer $token',language!,context);
      getBookingProgramsList=response!.data!;
      emit(GetBookingProgramsState());
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
      getCanceledProgramsList=response.data!;
      emit(GetCanceledProgramsSuccessState());
    }catch(e){
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast('$e', ToastStates.error, context);
      });
      emit(GetCanceledProgramsErrorState());
    }
  }
  void getCompletedPrograms(String token ,BuildContext context,String? language) async {
    try{
      final response = await _bookingRepo.getCompletedPrograms('Bearer $token',language!,context);
      getCompletedProgramsList=response!.data!;
      emit(GetCanceledProgramsSuccessState());
    }catch(e){
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast('$e', ToastStates.error, context);
      });
      emit(GetCanceledProgramsErrorState());
    }
  }

  void bookingPrograms(BookingRequest bookingRequest,BuildContext context) async {
    emit(BookingLoadingState());
    final response = await _bookingRepo.bookingPrograms('Bearer ${HomeCubit.get(context).token}',bookingRequest,context);
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        getBookingPrograms(HomeCubit.get(context).token!,context,context.locale.toString());
        emit(BookingSuccessState());
        showToast('${response!.message}', ToastStates.success, context);
        showCustomDialog2(
            title:'success'.tr(),
            des:response.message,
            bt1: AppImages.dialog,bt2:  'ok'.tr(),
            onPressed1: (){
              NavigatePages.pushReplacePage(const RootPages(check: '3',), context);
            },
            context: context);
      noteControllerBooking.text='';
    emit(BookingErrorState());
  });}
  void cancelingProgram(CanceledRequest canceledRequest,BuildContext context) async {
    try{
      final response = await _bookingRepo.cancelingProgram('Bearer ${HomeCubit.get(context).token}',canceledRequest,context);
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        getBookingPrograms(HomeCubit
            .get(context)
            .token!, context, context.locale.toString());
        getCanceledPrograms(HomeCubit
            .get(context)
            .token!, context, context.locale.toString());
        showToast('${response!.message}', ToastStates.success, context);
        Navigator.of(context).pop();
        noteControllerCanceled.text = '';
      });
        emit(BookingProgramsSuccessState());

    }catch(e){
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast('$e', ToastStates.error, context);
      });
      emit(BookingProgramsErrorState());
    }
  }
  void finishedProgram(CanceledRequest canceledRequest,BuildContext context,int programId) async {
    try{
      final response = await _bookingRepo.finishedProgram('Bearer ${HomeCubit.get(context).token}',canceledRequest,context);
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        getBookingPrograms(HomeCubit.get(context).token!,context,context.locale.toString());
        getCompletedPrograms(HomeCubit.get(context).token!,context,context.locale.toString());
        showToast('${response!.message}', ToastStates.success, context);
        Navigator.push( context,MaterialPageRoute(builder: (context)=> RateScreen(programId: programId,)));
      });
      emit(BookingProgramsSuccessState());

    }on DioException catch(e){
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast('$e', ToastStates.error, context);
      });
      emit(BookingProgramsErrorState());
    }
  }
  void ratingProgram(RatingRequest ratingRequest,BuildContext context) async {
    emit(RatingLoadingSuccessState());
    try{
      final response = await _bookingRepo.ratingProgram('Bearer ${HomeCubit.get(context).token}',ratingRequest,context);
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        getCompletedPrograms(HomeCubit.get(context).token!,context,context.locale.toString());
        commentController.text='';
        rate=3;
        showToast('${response!.message}', ToastStates.success, context);
        Navigator.pop(context);
      });
      emit(RatingProgramsSuccessState());
    }on DioException catch(e){
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast('$e', ToastStates.error, context);
      });
      emit(RatingProgramsErrorState());
    }
  }

  // ur way payment request
   urWayPayment({required String id, required String amount,required BuildContext context}) async {
    try {
      MoreCubit cubit =MoreCubit.get(context);
      HomeCubit cubitHomeCubit =HomeCubit.get(context);
      cubitHomeCubit.getLoc();
      ProfileResponse? profile =await cubit.getProfile(HomeCubit.get(context).token!, context);
      print('profile is id  ${profile!.id}');
      print('profile is ${profile.email}');

      final data = await Payment.makepaymentService(
        context: context,
        country: "SA",
        trackid: "${profile.id ?? '0'}$id${DateTime.now().millisecondsSinceEpoch}",
        currency: "SAR",
        action: "1",
        amt: amount,
        customerEmail: (profile.email != null && profile.email!.isNotEmpty) ?  profile.email!  : "noemail@no.no",
        udf1: "$id",
        udf2: "",
        udf3: "${profile.id}",
        udf4: "",
        udf5: "",
        cardToken: "",
        address:(cubitHomeCubit.address!=null) ?cubitHomeCubit.address! : "no address",
        city:(cubitHomeCubit.city!=null) ?cubitHomeCubit.city! : "no city",
        state: "Pending",
        tokenizationType: "1",
        zipCode: "",
        tokenOperation: "A/U/D", metadata:"",
      );
      log('Result in Main is :', data);
      emit(BookingProgramsSuccessState());
      return data;
    } on Exception catch (e) {
      log('Error in platform :', e.toString());
      rethrow;
    }

   }

   Future paymentCubit(PaymentRequest paymentRequest,context) async {
    emit(BookingLoadingState());
    final response = await _bookingRepo.payment(HomeCubit.get(context).token!,paymentRequest);
    response.when(success: (paymentResponse) {
      BookingRequest bookingRequest =BookingRequest(
        id: int.parse(paymentRequest.tourId!),
        notes: noteControllerBooking.text.isNotEmpty? noteControllerBooking.text:"note",
        payment:'Credit Card', total:double.parse(paymentRequest.amount!));
      bookingPrograms(bookingRequest, context);
      emit(PaymentSuccessState());
    }, failure: (error) {
      emit(PaymentErrorState());
    });
  }

  Future<void> makePayment({required String id, required String amount,required BuildContext context})async{
    emit(PaymentLoadingState());
     try{
       final data = await urWayPayment(id: id, amount: amount, context: context);
       UrWayResponse urWayResponse =UrWayResponse.fromJson(jsonDecode(data));
       if(urWayResponse.result=='Failure'){
         showToast('Failure payment', ToastStates.error, context);
       }else{
         PaymentRequest paymentRequest =PaymentRequest(paymentId: urWayResponse.paymentId!, tourId: urWayResponse.userField1!, userId:urWayResponse.userField3!, amount: urWayResponse.amount!, paymentType: urWayResponse.paymentType, result: urWayResponse.result);
         paymentCubit(paymentRequest, context);
       }

     }catch(e){
       log('makePayment  error', e.toString());

     }
  }
}
