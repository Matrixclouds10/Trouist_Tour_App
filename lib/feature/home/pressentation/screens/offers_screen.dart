import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/feature/home/pressentation/widgets/custom_offer_items.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key, this.offersResponseModel});
  final List<ProgramResponse>? offersResponseModel;
  @override
  Widget build(BuildContext context) {
    return
      MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ),
          child:  Scaffold(
            appBar:  PreferredSize(
                preferredSize: Size(double.infinity,62.h),
                child:  CustomAppBar(title:'offers'.tr(), hasBackButton: true,)),
            body:  ListView.builder(
                itemCount: offersResponseModel!.length,
                itemBuilder: (context,index){
                  return  CustomOfferItems(offersProgramResponse: offersResponseModel![index],);
                }),
          )
      );

  }
}
