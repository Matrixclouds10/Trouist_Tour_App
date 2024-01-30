import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/feature/offers/presentation/widgets/custom_offer_items.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});
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
                child: const CustomAppBar(title:'Offers', hasBackButton: true,)),
            body:  ListView.builder(
                itemCount: 20,
                itemBuilder: (context,index){
                  return const CustomOfferItems();
                }),
          )
      );

  }
}
