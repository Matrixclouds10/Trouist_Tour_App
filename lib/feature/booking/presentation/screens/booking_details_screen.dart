import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/booking/data/models/booking_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/screens/program_details.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_religious_program_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_top_detials_stack.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_trip_details.dart';

import '../../../../core/global/themeing/app_color/app_color_light.dart';
import '../../../../core/global/themeing/styles/styles.dart';
import '../../../../core/helpers/scale_size.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key, required this.type, required this.bookingResponse});
  final String type;
  final BookingResponse bookingResponse;
  @override
  Widget build(BuildContext context) {
    var program =
    ProgramResponse(
        bookingResponse.id, bookingResponse.name,
        bookingResponse.region, bookingResponse.description,
        bookingResponse.duration, bookingResponse.startDate,
        bookingResponse.price!.toDouble(), bookingResponse.groupSize,
        bookingResponse.groupType,
        bookingResponse.tourRoute!.map((e) =>
            TourRouteResponse(e.key!,
              e.value!,
            )).toList(),
        bookingResponse.departure, bookingResponse.departureTime,
        bookingResponse.returnTime, bookingResponse.priceIncludes,
        bookingResponse.isFav, bookingResponse.discountAmount,
        bookingResponse.newPrice!=null?bookingResponse.newPrice!.toDouble():0, bookingResponse.discountPercentage,
        bookingResponse.mainImage, bookingResponse.images!.map((e) => ImagesResponse(e.isVideo, e.size, e.image)).toList(), true,
        bookingResponse.endDate,
        bookingResponse.description,
      );
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTopDetailsStackWidget(isFav:bookingResponse.isFav, image: bookingResponse.images!.map((e) => e.image!).toList(), isVideo: bookingResponse.images!.map((e) => e.isVideo!).toList(), id: bookingResponse.id!,day: bookingResponse.duration,startDate: bookingResponse.startDate,),
              verticalSpace(24),
               CustomReligiousProgramWidget(
                 programResponse: program,
                 isHasDes: true,type: type,),
                 verticalSpace(24),
               CustomTripDetailsWidget(
                programResponse:program
              ),
              verticalSpace(24),
            type=='canceled'.tr()?
             Column(
               children: [
                 Container(
                   decoration: BoxDecoration(
                       color:  AppColorLight.customGray.withOpacity(0.10),
                       borderRadius: const BorderRadius.all(Radius.circular(10))
                   ),
                   width: double.infinity,
                   child: Padding(
                     padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('reason'.tr(),
                           maxLines: 1,
                           textScaleFactor: ScaleSize.textScaleFactor(context),
                           overflow: TextOverflow.ellipsis,
                           style: TextStyles.font17CustomBlack700WeightPoppins,
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text(bookingResponse.note!,
                             textScaleFactor: ScaleSize.textScaleFactor(context),
                             style: TextStyles.font17Black400WightLato.copyWith(
                                 fontSize: 14,
                                 color: AppColorLight.desColor),
                           ),
                         )

                       ],
                     ),
                   ),
                 ),
                 verticalSpace(24),
               ],
             ):const SizedBox.shrink(),

            ],
          ),
        ),
      ),
    );
  }
}
