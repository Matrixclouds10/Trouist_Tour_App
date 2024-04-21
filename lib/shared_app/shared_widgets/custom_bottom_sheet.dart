import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/booking/data/models/canceled_request.dart';
import 'package:tourist_tour_app/feature/booking/logic/booking_cubit.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_bottom_sheet_body_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_dialog.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_text_field.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key, required this.note, required this.id, required this.name});
  final String note;
  final String name;
  final int id;
  @override
  Widget build(BuildContext context) {
    BookingCubit cubit= BookingCubit.get(context);
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft:  Radius.circular(15))
      ),
      height:
      MediaQuery.of(context).viewInsets.bottom +
      MediaQuery.of(context).size.height*0.7,
      width: double.infinity,
      child: Padding(
        padding:  EdgeInsets.only(left: 16.w,right: 16.w),
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
              'button_sheet_title'.tr(),
                 textScaleFactor: ScaleSize.textScaleFactor(context),
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,
              style: TextStyles.font17Black400WightLato.copyWith(
                color: AppColorLight.customBlack
              )
            ),
            verticalSpace(5),
            Text(
                name,
                 textScaleFactor: ScaleSize.textScaleFactor(context),
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,
              style: TextStyles.font14CustomWight700wLato.copyWith(
                color: AppColorLight.primaryColor,
                fontSize: 12,
                fontFamily: AppFontsFamily.fontCairo,
              )
            ),
            verticalSpace(16),
            const CustomBottomSheetBodyWidget(),
            verticalSpace(16),
            CustomTextField(
              maxLines: 3,
                borderColor: AppColorLight.grayBorderColor,
                hintText: 'button_sheet_hint'.tr(),
                controller: BookingCubit.get(context).noteControllerCanceled),
            verticalSpace(23),
           CustomMaterialButtonWidget(text: 'button_sheet_btn'.tr(), onPressed: (){
                  showCustomDialog(
                    context: context,
                    title:'cancel'.tr(),des: 'sure_cancel'.tr(),bt1:  'yes'.tr(),bt2: 'no'.tr(),
                    onPressed1: (){
                      CanceledRequest canceledRequest=CanceledRequest(id: id, notes: '${cubit.valueCanceled} ${cubit.noteControllerCanceled.text}');
                      cubit.cancelingProgram(canceledRequest,context);
                      Navigator.of(context).pop();
                      cubit.valueCanceled='button_sheet_body1'.tr();
                    });
           }),
            verticalSpace(40),

          ],
        ),
      ),
    );
  }
}