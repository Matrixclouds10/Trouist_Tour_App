import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_grid_view.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_loading_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_not_data.dart';

class OurProgramsScreen extends StatelessWidget {
  const OurProgramsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit =HomeCubit.get(context);
    return Scaffold(
        appBar:  PreferredSize(
            preferredSize: Size(double.infinity,62.h),
            child:  CustomAppBar(title:'our_programs'.tr(), hasBackButton: true,)),
        body: SingleChildScrollView(
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              if(cubit.programResponseModel!=null){
                  if(cubit.programResponseModel!.isNotEmpty){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 16.w,right: 16.w,top: 15.h),
                          child:
                          CustomGridViewWidget(
                            imageHeight: 170,
                            titles: cubit.programResponseModel!.map((e) => e.name!).toList() ,
                            images: cubit.programResponseModel!.map((e) => e.images![0].image!).toList(),
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 5,
                            programResponse: cubit.programResponseModel,
                            crossAxisCount: 2, childAspectRatio: 1.15,
                            ),
                        ),
                      ],
                    );
                  }else{
                    return const CustomNotData();
                  }
              }
              else{
                return  Padding(
                    padding: EdgeInsets.symmetric(vertical: 100.h),
                    child: const CustomLoadingWidget());
              }
            },
          ),
        )
    );
  }
}
