import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/feature/more/logic/more_cubit.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    bool x1 =true;
    bool x2 =true;
    MoreCubit cubit =MoreCubit.get(context);
    return  MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0, ),
        child: Scaffold(
        appBar:  PreferredSize(
        preferredSize: Size(double.infinity,62.h),
    child:  CustomAppBar(title:'change_password'.tr(), hasBackButton: true,)),
    body:BlocConsumer<MoreCubit, DataState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(5),
                      Text('new_password'.tr(),
                        style: TextStyles.font17Black400WightLato.copyWith(
                          color: AppColorLight.customBlack,
                        ),
                      ),
                      StatefulBuilder(builder: (context,setState){
                        return
                          TextField(
                            obscureText: x1,
                            controller: cubit.passwordController,
                            decoration: InputDecoration(
                                suffixIcon:
                                IconButton(onPressed: (){
                                  setState(() {
                                    x1=!x1;
                                  });
                                },
                                  icon: x1==true? const Icon(Icons.visibility_off_outlined):const Icon(Icons.visibility),
                                )
                            ),
                          );
                      },),
                      verticalSpace(20),
                      Text('confirm_new_password'.tr(),
                        style: TextStyles.font17Black400WightLato.copyWith(
                          color: AppColorLight.customBlack,
                        ),
                      ),
                      StatefulBuilder(builder: (context,setState){
                        return
                          TextField(
                            controller: cubit.passwordConfirmController,
                            obscureText: x2,
                            decoration: InputDecoration(
                                suffixIcon:
                                IconButton(onPressed: (){
                                  setState(() {
                                    x2=!x2;
                                  });
                                },
                                  icon: x2==true? const Icon(Icons.visibility_off_outlined):const Icon(Icons.visibility),
                                )
                            ),
                          );
                      },),
                      verticalSpace(300),
                    cubit.isLoadingChange?const Center(child: CircularProgressIndicator(),):
                    CustomMaterialButtonWidget(
                          text: 'done'.tr(),
                          onPressed: (){
                            cubit.changePassword(HomeCubit.get(context).token!, context);
                          },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
    );
  }
}
