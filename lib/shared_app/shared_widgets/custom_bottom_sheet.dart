import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/booking/presentation/screens/booking_details_screen.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/screens/program_details.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_bottom_sheet_body_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_text_field.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft:  Radius.circular(15))
      ),
      height: MediaQuery.of(context).size.height*0.62,
      width: double.infinity,
      child: Padding(
        padding:  EdgeInsets.only(left: 16.w,right: 16.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              verticalSpace(16),
              Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: IconButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, icon: const Icon(Icons.clear,color: AppColorLight.gray2,))),
               Text(
                'Why do you want to cancel The Trip ?  ',
                style: TextStyles.font17Black400WightLato.copyWith(
                  color: AppColorLight.customBlack
                )
              ),
              verticalSpace(16),
              const CustomBottomSheetBodyWidget(),
              verticalSpace(16),
              CustomTextField(
                maxLines: 3,
                  borderColor: AppColorLight.grayBorderColor,
                  hintText: 'Enter a description...',
                  controller: TextEditingController()),
              verticalSpace(23),
             CustomMaterialButtonWidget(text: 'Send', onPressed: (){

             }),
              verticalSpace(40),

            ],
          ),
        ),
      ),
    );
  }
}