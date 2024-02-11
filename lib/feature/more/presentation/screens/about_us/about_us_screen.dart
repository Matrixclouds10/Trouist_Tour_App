import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/feature/more/logic/more_cubit.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_contant_data.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_loading_widget.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    MoreCubit cubit=MoreCubit.get(context);
    return
      MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0,),
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(double.infinity, 62.h),
              child:  CustomAppBar(
                title: 'about_us'.tr(), hasBackButton: true,)),
          body: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: BlocConsumer<MoreCubit, DataState>(
              listener: (context, state) {},
              builder: (context, state) {
                if(cubit.aboutUsResponse!=null){
                  return CustomAppContData(image:  cubit.aboutUsResponse!.image!,
                    title: cubit.aboutUsResponse!.name!, des: cubit.aboutUsResponse!.description!,);
                }else{
                  return const CustomLoadingWidget();
                }

              },
            ),
          ),

        ),
      );
  }
}
