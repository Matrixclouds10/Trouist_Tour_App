import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/make_program/presentation/screens/custom_program_screen.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';

class CustomMakeProgram extends StatelessWidget {
  const CustomMakeProgram({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height:170.h ,
      width: 345.w,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: AppColorLight.customGray.withOpacity(0.10),
      ),
      child: Column(
        children: [
          verticalSpace(16),
          FittedBox(
            child: SizedBox(
              width:315.w,
              // height: 71.h,
              child: Center(
                child: Text('Lorem ipsum dolor sit amet consectetur. Facilisi nam quam tellus etiam non ut vel at magna. Felis porta fermentum .',
                  style: TextStyles.font17CustomGray400WightLato.copyWith(
                      color: const Color(0xff4C5756)
                  ),
                  textScaleFactor: ScaleSize.textScaleFactor(context),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          verticalSpace(10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 0),
            child: CustomMaterialButtonWidget(
                height: 36,
                minWidth: 205.w,
                text: 'Make Your Program',
                textSize: 14,
                onPressed: (){
                  NavigatePages.pushToPage(const CustomProgramScreen(), context);
                }),
          ),
          verticalSpace(0),

        ],
      ),
    );
  }
}
