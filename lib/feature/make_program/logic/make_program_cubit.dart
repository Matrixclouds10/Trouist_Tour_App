 import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/global/toast_states/enums.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/feature/make_program/data/models/get_places_response.dart';
import 'package:tourist_tour_app/feature/make_program/data/models/make_program_request.dart';
import 'package:tourist_tour_app/feature/make_program/data/repo/make_program_repo.dart';
part 'make_program_state.dart';

class MakeProgramCubit extends Cubit<MakeProgramState> {
  final MakeProgramRepo _makeProgramRepo;
  MakeProgramCubit(this._makeProgramRepo) : super(MakeProgramInitial());
  static MakeProgramCubit get(BuildContext context)=>BlocProvider.of(context);
   GetPlacesResponse? getPlacesResponse;
   int currentMethod=1;
   int currentMethod2=1;
   TextEditingController familyNumberController=TextEditingController();
   TextEditingController friendsNumberController=TextEditingController();
   String typeOfGroup='Family';
   String typeOfArrivalMethod='Booking Flight';
   String? typeOfStaying;
   String? typeOfStayingPlace;
   int familyCounter=0;
   int friendsCounter=0;
   Future getPlaces(BuildContext context) async {
     final response = await _makeProgramRepo.places('Bearer ${HomeCubit.get(context).token!}');
     getPlacesResponse=response!.data;
     emit(GetPlacesStateSuccess());
   }
   final String type='';
   final String numberOfType='';


   Future makeProgram(BuildContext context) async {
     if(typeOfGroup=='Family'){
       if(familyCounter==0){
         showToast('Number of person equal zero', ToastStates.error, context);
       }else if(familyNumberController.text.isEmpty){
         showToast('The Range Age Group is Empty', ToastStates.error, context);
       }else if(typeOfStaying==null){
         showToast('Choose the type of staying', ToastStates.error, context);
       }else if (typeOfStaying!='Furnished Apartments'&&typeOfStaying!='Chalets'){
         if (typeOfStayingPlace==null){
           showToast('Choose the type of place staying', ToastStates.error, context);
         }else{
           MakeProgramRequest makeProgramRequest= MakeProgramRequest(
               typeOfGroup,
               familyCounter.toString(),
               familyNumberController.text, '', '',
               typeOfArrivalMethod,
               typeOfStaying,
               typeOfStayingPlace, '', '', '', '');
           final response = await _makeProgramRepo.makeProgram('Bearer ${HomeCubit.get(context).token!}',makeProgramRequest);
           Future.delayed(const Duration(microseconds: 0)).then((value) {
             showToast('${response!.message}', ToastStates.success, context);
             Navigator.of(context).pop();
             familyCounter=0;
             friendsCounter=0;
             familyNumberController.text='';
             friendsNumberController.text='';
             typeOfStaying=null;
             typeOfStayingPlace=null;
           });
         emit(GetPlacesStateSuccess());
       }
     }else{
         MakeProgramRequest makeProgramRequest= MakeProgramRequest(
             typeOfGroup,
             familyCounter.toString(),
             familyNumberController.text, '', '',
             typeOfArrivalMethod,
             typeOfStaying,
             typeOfStayingPlace, '', '', '', '');
         final response = await _makeProgramRepo.makeProgram('Bearer ${HomeCubit.get(context).token!}',makeProgramRequest);
         Future.delayed(const Duration(microseconds: 0)).then((value) {
           showToast('${response!.message}', ToastStates.success, context);
           Navigator.of(context).pop();
           familyCounter=0;
           friendsCounter=0;
           familyNumberController.text='';
           friendsNumberController.text='';
           typeOfStaying=null;
           typeOfStayingPlace=null;
         });
       }
       emit(GetPlacesStateSuccess());
     }

     else if(typeOfGroup=='Friends'){
       if(friendsCounter==0){
         showToast('Number of person equal zero', ToastStates.error, context);
       }
       else if(friendsNumberController.text.isEmpty){
         showToast('The Range Age Group is Empty', ToastStates.error, context);
       }
       else if(typeOfStaying==null){
         showToast('Choose the type of staying', ToastStates.error, context);
       }else if (typeOfStaying!='Furnished Apartments'&&typeOfStaying!='Chalets'){
         if (typeOfStayingPlace==null){
           showToast('Choose the type of place staying', ToastStates.error, context);
         }else{
           MakeProgramRequest  makeProgramRequest= MakeProgramRequest(
               typeOfGroup,
              '',
               friendsNumberController.text,  friendsCounter.toString(), '',
               typeOfArrivalMethod,
               typeOfStaying,
               typeOfStayingPlace, '', '', '', '');

           final response = await _makeProgramRepo.makeProgram('Bearer ${HomeCubit.get(context).token!}',makeProgramRequest);
           Future.delayed(const Duration(microseconds: 0)).then((value) {
             showToast('${response!.message}', ToastStates.success, context);
             Navigator.of(context).pop();
             familyCounter=0;
             friendsCounter=0;
             familyNumberController.text='';
             friendsNumberController.text='';
             typeOfStaying=null;
             typeOfStayingPlace=null;
           });

         emit(GetPlacesStateSuccess());
         }
     }else{
         MakeProgramRequest  makeProgramRequest= MakeProgramRequest(
             typeOfGroup,
            '',
              friendsNumberController.text, friendsCounter.toString(), '',
             typeOfArrivalMethod,
             typeOfStaying,
             typeOfStayingPlace, '', '', '', '');

         final response = await _makeProgramRepo.makeProgram('Bearer ${HomeCubit.get(context).token!}',makeProgramRequest);
         Future.delayed(const Duration(microseconds: 0)).then((value) {
           showToast('${response!.message}', ToastStates.success, context);
           Navigator.of(context).pop();
           familyCounter=0;
           friendsCounter=0;
           familyNumberController.text='';
           friendsNumberController.text='';
           typeOfStaying=null;
           typeOfStayingPlace=null;
         });
       }
       emit(GetPlacesStateSuccess());

     }
     else{
       if(typeOfStaying==null){
         showToast('Choose the type of staying', ToastStates.error, context);
       }else if (typeOfStaying!='Furnished Apartments'&&typeOfStaying!='Chalets'){
         if (typeOfStayingPlace==null){
           showToast('Choose the type of place staying', ToastStates.error, context);
         }else{
           MakeProgramRequest makeProgramRequest= MakeProgramRequest(
               typeOfGroup,
               '',
               '', '', '',
               typeOfArrivalMethod,
               typeOfStaying,
               typeOfStayingPlace, '', '', '', '');

           final response = await _makeProgramRepo.makeProgram('Bearer ${HomeCubit.get(context).token!}',makeProgramRequest);
           Future.delayed(const Duration(microseconds: 0)).then((value) {
             showToast('${response!.message}', ToastStates.success, context);
             Navigator.of(context).pop();
             familyCounter=0;
             friendsCounter=0;
             familyNumberController.text='';
             friendsNumberController.text='';
             typeOfStaying=null;
             typeOfStayingPlace=null;
           });
         }
       }else{
         MakeProgramRequest makeProgramRequest= MakeProgramRequest(
             typeOfGroup,
             '',
             '', '', '',
             typeOfArrivalMethod,
             typeOfStaying,
             typeOfStayingPlace, '', '', '', '');

         final response = await _makeProgramRepo.makeProgram('Bearer ${HomeCubit.get(context).token!}',makeProgramRequest);
         Future.delayed(const Duration(microseconds: 0)).then((value) {
           showToast('${response!.message}', ToastStates.success, context);
           Navigator.of(context).pop();
           familyCounter=0;
           friendsCounter=0;
           familyNumberController.text='';
           friendsNumberController.text='';
           typeOfStaying=null;
           typeOfStayingPlace=null;
         });
       }
     }
   }
}
