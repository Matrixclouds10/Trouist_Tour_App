import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/feature/more/logic/more_cubit.dart';
import 'package:tourist_tour_app/feature/more/presentation/screens/history_program/widgets/couples_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_loading_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MoreCubit cubit =MoreCubit.get(context);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: 1.0,),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 62.h),
            child:  CustomAppBar(
              title: 'program_history2'.tr(), hasBackButton: true,)),
        body: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: BlocConsumer<MoreCubit, DataState>(
            listener: (context, state) {},
            builder: (context, state) {
              if(cubit.historyResponseList!=null){
                 if(cubit.historyResponseList!.isEmpty){
                   return Column(
                     children: [
                       verticalSpace(80),
                       Center(
                         child: SizedBox(
                             height: 250.h,
                             width: 270.w,
                             child: Image.asset(AppImages.history)),
                       ),
                       verticalSpace(20),
                       Text('program_history3'.tr(),
                         style: TextStyles.font14CustomWight700wLato.copyWith(
                             color: AppColorLight.customBlack
                         ),),

                     ],
                   );
                 }else{
                   return ListView.builder(
                       itemCount:cubit.historyResponseList!.length ,
                       itemBuilder: (context,index){
                     return HistoryItemWidget(historyResponse: cubit.historyResponseList![index]);
                   });
                 }
              }else{
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomLoadingWidget(),
                  ],
                );
              }
            },
          ),
        ),

      ),
    );
  }
}
