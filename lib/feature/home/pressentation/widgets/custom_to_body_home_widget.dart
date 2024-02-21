import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/feature/home/pressentation/screens/notification_screen.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_slider_widget.dart';

class CustomTopBodyHomeWidget extends StatelessWidget {
  const CustomTopBodyHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 342.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.location_on_outlined,
                    color: Theme
                        .of(context)
                        .primaryColor,),
                  horizontalSpace(4),
                  Expanded(
                    child: Text(cubit.location,
                      style: TextStyles.font17Black400WightLato.copyWith(
                          fontFamily: AppFontsFamily.fontPoppins,
                          fontSize: 12
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      NavigatePages.pushToPage(
                          const NotificationScreen(), context);
                    },
                    child: const Icon(Icons.notifications_none,
                      color: AppColorLight.gray2,
                    ),
                  )
                ],
              ),
            ),
            verticalSpace(16),
            Text("begin_home".tr(),
              style: TextStyles.font24CustomBlack700WeightPoppins,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace(16),
            BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (cubit.slidersResponseModel != null) {
                  return CustomSliderWidget(
                      height: 190.h,
                      isCenterPages: true,
                      isHasRadius: true,
                      image: cubit.slidersResponseModel!.map((obj) =>
                          obj.image!.toString()).toList());
                } else {
                  return const Center(child: CircularProgressIndicator(),);
                }
              },
            ),
            verticalSpace(16),
          ],
        );
      },
    );
  }
}
