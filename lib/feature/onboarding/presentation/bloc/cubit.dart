import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/feature/auth/log_as.dart';
import 'package:tourist_tour_app/feature/onboarding/presentation/bloc/states.dart';
import '../../../../core/services/routeing_page/routing.dart';
import '../../../../core/shared_preference/shared_preference.dart';
import '../../data/data_sources/local_database.dart';
import '../../data/models/model.dart';
import '../../data/repositories/repo.dart';
import '../../domain/repositories/base_repo.dart';
import '../../domain/use_cases/use_case.dart';

class AppOnBoardingCubit extends Cubit<AppOnBoardingStates>{


  AppOnBoardingCubit() : super(AppInitialOnBoardingStates()){
    init();
  }
  void init(){
    BaseLocalDataBase baseLocalDataBase =LocalDataBase();
    BaseOnBoardingRepo baseOnBoardingRepo =OnBoardingRepo(baseLocalDataBase);
    list= OnBoardingUseCase(baseOnBoardingRepo).getOnBoarding();
    print("list ${list[0].title}");
    emit(AppGetData());
  }


  static AppOnBoardingCubit get(context)=>BlocProvider.of(context);
   List<OnBoardingModel> list=[];
  int page =0;
  int currentPage =0;
  void changeCurrentPage(int x){
    currentPage=x;
    emit(ChangeCurrentPageState());
  }
  void changingPageView(context){
    if(page == list.length-1){
      CacheHelper.saveDate(key: 'onBoarding', value: true).then((value) =>
       {
          NavigatePages.pushReplacePage(const LogAs(), context)
       });
    }
    else
    {
      pageController.nextPage(
          duration: const Duration(milliseconds: 800), curve: Curves.easeInBack);
      // currentPage++;

    }
    emit(AppChangingPageView());
  }

  PageController pageController=PageController();

}
