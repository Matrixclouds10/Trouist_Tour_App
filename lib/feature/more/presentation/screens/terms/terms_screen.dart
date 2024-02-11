import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/feature/more/logic/more_cubit.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_contant_data.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_loading_widget.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MoreCubit cubit =MoreCubit.get(context);

    return
      MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: 1.0, ),
      child: Scaffold(
        appBar:  PreferredSize(
            preferredSize: Size(double.infinity,62.h),
            child:  CustomAppBar(title:'t&c'.tr(), hasBackButton: true,)),
        body:
        Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: BlocConsumer<MoreCubit, DataState>(
            listener: (context, state) {},
            builder: (context, state) {
              if(cubit.termsAppResponse!=null){
                //Image.asset(AppImages.terms)
                return CustomAppContData(image: cubit.termsAppResponse!.image!,
                    title: cubit.termsAppResponse!.name!, des: cubit.termsAppResponse!.description!);
              }
              else{
                return const CustomLoadingWidget();
              }

            },
          ),
        ),
      ),
    );
  }
}
