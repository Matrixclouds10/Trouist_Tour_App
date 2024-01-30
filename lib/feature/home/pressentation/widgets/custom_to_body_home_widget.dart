import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/home/pressentation/screens/notification_screen.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_slider_widget.dart';

class CustomTopBodyHomeWidget extends StatelessWidget {
  const CustomTopBodyHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                color: Theme.of(context).primaryColor,),
              horizontalSpace(4),
              Text('king Abdelaziz St',
                style: TextStyles.font17Black400WightLato.copyWith(
                  fontFamily: AppFontsFamily.fontPoppins,
                ),
                textScaleFactor: ScaleSize.textScaleFactor(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              InkWell(
                onTap: (){
                  NavigatePages.pushToPage(const NotificationScreen(), context);
                },
                child: const Icon(Icons.notifications_none,
                  color: AppColorLight.gray2,
                ),
              )
            ],
          ),
        ),
        verticalSpace(16),
        Text(" Let's The Fun Begin !",
          style: TextStyles.font24CustomBlack700WeightPoppins,
          textScaleFactor: ScaleSize.textScaleFactor(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        verticalSpace(16),
        CustomSliderWidget(
         height: 190.h,
         isCenterPages: true,
         isHasRadius: true,
         image: const [AppImages.category,AppImages.category,AppImages.category,AppImages.category,AppImages.category,AppImages.category,],),
        verticalSpace(16),
      ],
    );
  }
}
