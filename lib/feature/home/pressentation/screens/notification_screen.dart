import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/feature/home/pressentation/widgets/custom_notification_item.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit =HomeCubit.get(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 62.h),
          child:  CustomAppBar(
            title: 'notifications'.tr(), hasBackButton: true,)),
      body:
      RefreshIndicator(
          onRefresh: ()async{
            await Future.delayed(const Duration(seconds: 1)).then((value) {
                cubit.getNotificationCubit(context);
          });
          },
          child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if(cubit.notificationResponse!=null){
            if(cubit.notificationResponse!.isEmpty){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Image.asset(AppImages.notification)),
                  Text('no_data_notification'.tr(),
                      style: TextStyles.font17CustomBlack700WeightPoppins
                  )
                ],
              );
            }
            else{
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
                  child: ListView.builder(
                      itemCount: cubit.notificationResponse!.length,
                      itemBuilder: (context,index){
                        return  CustomNotificationItem(notificationResponse: cubit.notificationResponse![index],);
                      })

              );
            }
          }
          else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ))

    );
  }
}
