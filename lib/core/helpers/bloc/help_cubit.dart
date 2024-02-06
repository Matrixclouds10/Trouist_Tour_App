import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
part 'help_state.dart';

class HelpCubit extends Cubit<HelpState> {
  HelpCubit() : super(HelpInitial());
  bool isCheckColor=false;
  bool isChecked=false;
  Color color=AppColorLight.customGray;
  Color color2=AppColorLight.customBlue;
  void changeColor(Color x){
    color=x;
    emit(ChangeColorState());
  }
  void changeCheck(bool x){
    isChecked=x;
    emit(ChangeColorState());
  }
}
