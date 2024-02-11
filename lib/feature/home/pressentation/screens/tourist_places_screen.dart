import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_grid_view.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_loading_widget.dart';

class TouristPlacesScreen extends StatelessWidget {
  const TouristPlacesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit =HomeCubit.get(context);
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size(double.infinity,62.h),
          child:  CustomAppBar(title:'tourist_places'.tr(), hasBackButton: true,)),
      body: BlocConsumer<HomeCubit, DataState>(
          listener: (context, state) {},
          builder: (context, state) {
            if(cubit.touristPlacesResponseModel!=null){
               if(cubit.touristPlacesResponseModel!.isNotEmpty){
                 return SingleChildScrollView(
                   child: Padding(
                     padding:  EdgeInsets.only(left: 16.w,right: 16.w,top: 15.h),
                     child:
                     CustomGridViewWidget(
                       isPlaces: true,
                       imageHeight: 170,
                       titles: cubit.touristPlacesResponseModel!.map((e) => e.region!).toList(),
                       images: cubit.touristPlacesResponseModel!.map((e) => e.images![0].image!).toList(),
                       mainAxisSpacing: 10,
                       crossAxisSpacing: 5,
                       crossAxisCount: 2, childAspectRatio: 1.15,
                       touristPlaces: cubit.touristPlacesResponseModel!,
                      ),
                   ),
                 );
               }else{
                 return const Center(child: Text('No Data Now'),);
               }
            }else{
              return const CustomLoadingWidget();
            }
          },
        )
    );
  }
}
