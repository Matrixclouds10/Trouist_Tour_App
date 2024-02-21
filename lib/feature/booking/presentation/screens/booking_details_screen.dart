import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/booking/data/models/booking_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/screens/program_details.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_religious_program_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_top_detials_stack.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_trip_details.dart';

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
        bookingResponse.mainImage, bookingResponse.images!.map((e) => ImagesResponse(e.isVideo, e.size, e.image)).toList());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTopDetailsStackWidget(isFav:bookingResponse.isFav, image: bookingResponse.images!.map((e) => e.image!).toList(), isVideo: bookingResponse.images!.map((e) => e.isVideo!).toList(), id: bookingResponse.id!,),
            verticalSpace(24),
             CustomReligiousProgramWidget(
               programResponse: program,
               isHasDes: true,type: type,),
            verticalSpace(24),
             CustomTripDetailsWidget(
              programResponse:program
            ),
            verticalSpace(24),
          ],
        ),
      ),
    );
  }
}
