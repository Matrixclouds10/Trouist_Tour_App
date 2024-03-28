import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/global/toast_states/enums.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/feature/make_program/logic/make_program_cubit.dart';
import 'package:tourist_tour_app/feature/make_program/presentation/screens/custom_program_screen.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';

class CustomMakeProgram extends StatelessWidget {
  const CustomMakeProgram({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 345.w,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: AppColorLight.customGray.withOpacity(0.10),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpace(5),
            Text('home_des'.tr(),
              style: TextStyles.font17CustomGray400WightLato.copyWith(
                  color: const Color(0xff4C5756),
                fontSize: 14
              ),
              maxLines: null,
              // overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
            verticalSpace(10),
            Container(
              height:40,
              padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 3),
              child: CustomMaterialButtonWidget(
                  height: 36,
                  minWidth: 205.w,
                  text: 'make_program'.tr(),
                  textSize: 14,
                  onPressed: (){
                    if(HomeCubit.get(context).token!=null){
                      MakeProgramCubit.get(context).getPlaces(context);
                      NavigatePages.pushToPage(const CustomProgramScreen(), context);
                    }else{
                      showToast('Log_in_first'.tr(), ToastStates.error, context);
                    }
                  }),
            ),
            verticalSpace(5),

          ],
        ),
      ),
    );
  }
}
