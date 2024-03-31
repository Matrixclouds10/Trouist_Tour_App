import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_text_field.dart';

import '../../../more/logic/more_cubit.dart';
import '../../data/models/rating_request.dart';
import '../../logic/booking_cubit.dart';

class RateScreen extends StatelessWidget {
  const RateScreen({super.key, required this.programId});
  final int programId;
  @override
  Widget build(BuildContext context) {
    BookingCubit  cubit =BookingCubit.get(context);
    return PopScope(
      canPop: false,
      onPopInvoked: (_) async {},
      child: Scaffold(
        appBar:  PreferredSize(
            preferredSize: Size(double.infinity,62.h),
            child:  CustomAppBar(title:'review'.tr(), hasBackButton: true,
              icon: Icons.clear,
            )),
        body: Padding(
          padding:  EdgeInsets.only(left: 16.w,right: 16.w),
          child: SingleChildScrollView (
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 verticalSpace(40),
                 Center(
                     child: Image.asset(AppImages.rate)),
                 verticalSpace(32),
                Text('feedback'.tr(),
                  textScaleFactor: ScaleSize.textScaleFactor(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                style: TextStyles.font24CustomBlack700WeightPoppins.copyWith(
                  fontFamily: AppFontsFamily.fontPoppins
                ),),
                verticalSpace(8),
                Text('feedback_des'.tr(),
                  textScaleFactor: ScaleSize.textScaleFactor(context),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font17Black400WightLato.copyWith(
                      color: AppColorLight.customBlack
                  ),),
                verticalSpace(32),
                Text('title_rate'.tr(),
                  textScaleFactor: ScaleSize.textScaleFactor(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font17Black400WightLato.copyWith(
                      color: AppColorLight.customBlack,
                      fontFamily: AppFontsFamily.fontPoppins

                  ),),
                verticalSpace(8),
                RatingBar.builder(
                  initialRating: cubit.rate,
                  minRating: 0.6,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0,vertical: 10),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                   cubit.putRate(rating);
                  },
                ),
                verticalSpace(20),
                CustomTextField(
                    contentHorizontalPadding:20,
                    contentVerticalPadding: 20,
                    fillColor:AppColorLight.grayBackGroundColor,
                    borderColor:AppColorLight.grayBackGroundColor,
                    maxLines: 6,
                    hintText: 'text_rate'.tr(),
                    controller:cubit.commentController),
                verticalSpace(73),
                BlocConsumer<BookingCubit, BookingState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return CustomMaterialButtonWidget(
                                    text: 'send_feedback'.tr(),
                                    isLoading: state is RatingLoadingSuccessState,
                                    onPressed: (){
                                      RatingRequest ratingRequest=RatingRequest(userId: MoreCubit.get(context).profileResponse!.id!.toString(), programId: programId.toString(), rating: int.parse(cubit.rate.toStringAsFixed(0)).toString(), comment: cubit.commentController.text);
                                      cubit.ratingProgram(ratingRequest, context);
                                    });
                    },
                  ),
                  verticalSpace(50),
              ],),
          ),
        ),

      ),
    );
  }
}
