import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/logger.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/auth/log_as.dart';
import 'package:tourist_tour_app/feature/booking/data/models/booking_request.dart';
import 'package:tourist_tour_app/feature/booking/logic/booking_cubit.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_dialog.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_text_field.dart';

import '../../../root_pages/root_page.dart';

class ConfirmBookingScreen extends StatefulWidget {
  const ConfirmBookingScreen({super.key, this.programResponse});
  final ProgramResponse? programResponse;

  @override
  State<ConfirmBookingScreen> createState() => _ConfirmBookingScreenState();
}

class _ConfirmBookingScreenState extends State<ConfirmBookingScreen> {
   int currentMethod=0;
  @override
  Widget build(BuildContext context) {
    BookingCubit bookingCubit=BookingCubit.get(context);
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size(double.infinity,62.h),
          child:  CustomAppBar(title:'confirmation'.tr(), hasBackButton: true,)),
      body: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(height: 200.h, width: double.infinity, child:
             Image.network(
               widget.programResponse!.images![0].image!,fit: BoxFit.cover,
             errorBuilder: (context,error,v){
                 return Image.asset(AppImages.holder,fit: BoxFit.cover,);
             },
             )),
            verticalSpace(24),
            Container(
              width: 343.w,
              decoration: BoxDecoration(
                  color: AppColorLight.customGray.withOpacity(0.10),
                  borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child:  Padding(
                padding:  EdgeInsets.only(left: 16.w,right: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(13),
                    Text(widget.programResponse!.name!,
                      textScaleFactor: ScaleSize.textScaleFactor(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font17CustomBlack700WeightPoppins,
                    ),
                    Row(
                      children: [
                        Text('${widget.programResponse!.price!.toString()} ${'rs'.tr()}',
                          textScaleFactor: ScaleSize.textScaleFactor(context),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                          widget.programResponse!.newPrice!=null &&widget.programResponse!.newPrice!=0?
                          TextStyles.font17CustomBlack700WeightPoppins.copyWith(
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppColorLight.redColor,
                              color: AppColorLight.redColor):
                          TextStyles.font17CustomBlack700WeightPoppins.copyWith(
                              color: AppColorLight.redColor),
                        ),
                        horizontalSpace(5),
                        widget.programResponse!.newPrice!=null&&widget.programResponse!.newPrice!=0?
                        Text('${widget.programResponse!.newPrice!.toString()} ${'rs'.tr()}',
                          textScaleFactor: ScaleSize.textScaleFactor(context),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.font17CustomBlack700WeightPoppins.copyWith(
                              color: AppColorLight.desColor),
                        ):const SizedBox.shrink(),
                        const Spacer(),
                      ],
                    ),
                    verticalSpace(16),
                    Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(AppImages.returnCloc),
                            horizontalSpace(5),
                            Text('${widget.programResponse!.duration} ${'days'.tr()}',
                              textScaleFactor: ScaleSize.textScaleFactor(context),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.font17Black400WightLato.copyWith(
                                color: AppColorLight.customBlack,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined,color: AppColorLight.gray2,),
                            horizontalSpace(5),
                            SizedBox(
                              width: 120.w,
                              child: Text('${widget.programResponse!.region}',
                                textScaleFactor: ScaleSize.textScaleFactor(context),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.font17Black400WightLato.copyWith(
                                  color: AppColorLight.customBlack,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    verticalSpace(5),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month_outlined,color: AppColorLight.gray2,),
                        horizontalSpace(5),
                        Text(' ${'from'.tr()} ${widget.programResponse!.startDate} ${'to'.tr()} ${widget.programResponse!.endDate}',
                          textScaleFactor: ScaleSize.textScaleFactor(context),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.font17Black400WightLato.copyWith(
                            color: AppColorLight.customBlack,
                          ),

                        ),
                      ],
                    ),
                    verticalSpace(20),
                    Text('notes'.tr(),
                      textScaleFactor: ScaleSize.textScaleFactor(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font17CustomBlack700WeightPoppins.copyWith(
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    verticalSpace(8),
                    CustomTextField(
                      borderColor: Colors.white,
                      maxLines: 4,
                      hintText:'',
                      controller: bookingCubit.noteControllerBooking,),
                    verticalSpace(8),

                  ],
                ),
              ),
            ),
            verticalSpace(24),
            Container(
              width: 343.w,
              decoration: BoxDecoration(
                  color: AppColorLight.customGray.withOpacity(0.10),
                  borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('payment_methods'.tr(),
                      textScaleFactor: ScaleSize.textScaleFactor(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font17CustomBlack700WeightPoppins.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp
                      ),),
                    verticalSpace(16),

                   Row(
                     children: [
                       Radio(
                         activeColor:AppColorLight.primaryColor,
                         value: 0,
                         groupValue: currentMethod,
                         onChanged: (value) {
                           // cubit.changeRadio(value!);
                           setState(() {
                             currentMethod = value!;
                           });
                         },
                       ),
                       SizedBox(
                           height: 23.h,
                           width: 32.w,
                           child: Image.asset(AppImages.card,fit: BoxFit.cover,)),
                       horizontalSpace(10),
                       Text('visa'.tr(),
                         textScaleFactor: ScaleSize.textScaleFactor(context),
                         overflow: TextOverflow.ellipsis,
                         style: TextStyles.font17CustomBlack500WeightPoppins.copyWith(
                           fontWeight: FontWeight.w600,

                         ),),

                     ],
                   ),
                   Row(
                     children: [
                       Radio(
                         activeColor:AppColorLight.primaryColor,
                         value: 1,
                         groupValue: currentMethod,
                         onChanged: (value) {
                           // cubit.changeRadio(value!);
                           setState(() {
                             currentMethod = value!;
                           });
                         },
                       ),
                       SizedBox(
                           height: 23.h,
                           width: 32.w,
                           child: Image.asset(AppImages.cash,fit: BoxFit.cover,color: Colors.grey,)),
                       horizontalSpace(10),
                       Text('cash'.tr(),
                         textScaleFactor: ScaleSize.textScaleFactor(context),
                         overflow: TextOverflow.ellipsis,
                         style: TextStyles.font17CustomBlack500WeightPoppins.copyWith(
                           fontWeight: FontWeight.w600,

                         ),),
                     ],
                   )
                  ],
                ),
              ),
            ),
            verticalSpace(40),

            BlocConsumer<BookingCubit, BookingState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 16.w),
                      child:
                      widget.programResponse!.isBooked==false?
                      CustomMaterialButtonWidget(
                                  isLoading: state is BookingLoadingState,
                                  text: 'confirm'.tr(),
                                  onPressed: (){
                                    if(HomeCubit.get(context).token!=null){
                                      if(currentMethod==0){
                                        bookingCubit.makePayment(id: widget.programResponse!.id.toString(),
                                            amount: '${widget.programResponse!.newPrice!=null?widget.programResponse!.newPrice!:widget.programResponse!.price}', context: context);
                                      }
                                      else{
                                        BookingRequest bookingRequest =BookingRequest(
                                          id: widget.programResponse!.id,
                                          notes: bookingCubit.noteControllerBooking.text.isNotEmpty?
                                          bookingCubit.noteControllerBooking.text:"note",
                                          payment:  'Cash', total:  widget.programResponse!.newPrice!=null?
                                          double.parse(widget.programResponse!.newPrice.toString()):double.parse(widget.programResponse!.price.toString()),);
                                          bookingCubit.bookingPrograms(bookingRequest, context);
                                      }
                                      }else{
                                      showCustomDialog2(
                                          title:'success'.tr(),
                                          des:'Log_in_first'.tr(),
                                          bt1:  AppImages.logMessage,
                                          bt2:  'sign_up2'.tr(),
                                          onPressed1: (){
                                            NavigatePages.pushReplacePage(const LogAs(), context);
                                          },
                                          context: context);
                                    }
                                  }):
                      CustomMaterialButtonWidget(
                          backgroundColor: AppColorLight.redColor,
                          text: 'confirm2'.tr(),
                          onPressed: (){
                            if(HomeCubit.get(context).token!=null){
                              bookingCubit.getBookingPrograms(HomeCubit.get(context).token!,context,context.locale.toString());
                              NavigatePages.pushReplacePage(const RootPages(check: '3',), context);
                            }else{
                              showCustomDialog2(
                                  title:'success'.tr(),
                                  des:'Log_in_first'.tr(),
                                  bt1:  AppImages.logMessage,
                                  bt2:  'sign_up2'.tr(),
                                  onPressed1: (){
                                    NavigatePages.pushReplacePage(const LogAs(), context);
                                  },
                                  context: context);
                            }
                          })
                      ,
                    );
                  },
                ),
            verticalSpace(50),
          ],
        ),
      ),
    );
  }
}
