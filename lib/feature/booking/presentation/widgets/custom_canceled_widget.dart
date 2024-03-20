import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/booking/logic/booking_cubit.dart';
import 'package:tourist_tour_app/feature/booking/presentation/screens/booking_details_screen.dart';
import 'package:tourist_tour_app/feature/booking/presentation/widgets/custom_program_item.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/screens/program_details.dart';

class CustomCanceledWidget extends StatelessWidget {
  const CustomCanceledWidget({super.key});

  @override
  Widget build(BuildContext context) {
    BookingCubit cubit =BookingCubit.get(context);
    return Padding(
      padding:  EdgeInsets.only(bottom: 50.h),
      child: BlocConsumer<BookingCubit, BookingState>(
          listener: (context, state) {},
          builder: (context, state) {
            if(cubit.getCanceledProgramsList!=null){
              if(cubit.getCanceledProgramsList!.isNotEmpty){
                return ListView.builder(
                    itemCount: cubit.getCanceledProgramsList!.length,
                    itemBuilder: (context,index){
                      var bookingResponse =cubit.getCanceledProgramsList![index];
                      return InkWell(
                        onTap: (){
                          NavigatePages.pushToPage(
                               BookingDetailsScreen(type: 'canceled'.tr(), bookingResponse: cubit.getCanceledProgramsList![index],), context);
                        },
                        child: CustomProgramItem(
                          programResponse: cubit.getCanceledProgramsList![index],
                          textButtonText: 'book_again'.tr(),
                          onPressed: () {
                            NavigatePages.pushToPage(
                                ProgramDetailsScreen(
                                  programResponse:
                                  ProgramResponse(
                                      bookingResponse.id, bookingResponse.name,
                                      bookingResponse.region, bookingResponse.description,
                                      bookingResponse.duration, bookingResponse.startDate,
                                      bookingResponse.price, bookingResponse.groupSize,
                                      bookingResponse.groupType,
                                      bookingResponse.tourRoute!.map((e) =>
                                          TourRouteResponse(e.key!,
                                            e.value!,
                                          )).toList(),
                                      bookingResponse.departure, bookingResponse.departureTime,
                                      bookingResponse.returnTime, bookingResponse.priceIncludes,
                                      bookingResponse.isFav, bookingResponse.discountAmount,
                                      bookingResponse.newPrice, bookingResponse.discountPercentage,
                                      bookingResponse.mainImage, bookingResponse.images!.map((e) => ImagesResponse(e.isVideo, e.size, e.image)).toList()),
                                  type: 'Canceled',), context);
                            },),
                      );
                    });
              }else{
                return Center(child: Text('no_data_currently'.tr()),);
              }
            }else{
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        ),
    );

  }
}
