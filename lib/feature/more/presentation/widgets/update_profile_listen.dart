import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/toast_states/enums.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/feature/more/logic/more_cubit.dart';

class UpdateProfileBlocListener extends StatelessWidget {
  const UpdateProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    MoreCubit cubit =MoreCubit.get(context);
    return BlocListener<MoreCubit, DataState>(
      listener: (context, state) {
        if(cubit.isLoading == 'loading'){
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color:AppColorLight.primaryColor,
              ),
            ),
          );
        }
        if(cubit.isLoading=='stop'){
           Navigator.of(context).pop();
          showToast('Update Successfully', ToastStates.success, context);
        }
        // if(state is FailureStateListener){
        //   showToast("Can't update now , please try again", ToastStates.error, context);
        // }
      },
      child: const SizedBox.shrink(),
    );
  }

}
