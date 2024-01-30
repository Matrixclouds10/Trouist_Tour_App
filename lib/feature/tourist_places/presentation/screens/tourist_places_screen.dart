import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/tourist_places/presentation/screens/tourist_places_details_screen.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_grid_view.dart';

class TouristPlacesScreen extends StatelessWidget {
  const TouristPlacesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size(double.infinity,62.h),
          child: const CustomAppBar(title:'Tourist Places', hasBackButton: true,)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 16.w,right: 16.w,top: 15.h),
              child:
              CustomGridViewWidget(
                isPlaces: true,
                imageHeight: 170,
                titles: const ['Al-Rahma Mosque','Rijal Almaa Village','Al Tayebat Museum',
                  'Al-Ula Village','Al-Rahma Mosque','Rijal Almaa Village','Al Tayebat Museum','Al-Ula Village'],
                images: const [AppImages.test,AppImages.test,AppImages.test,AppImages.test,
                  AppImages.test,AppImages.test,AppImages.test,AppImages.test],
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
                crossAxisCount: 2, childAspectRatio: 1.15, onTap: (){
                NavigatePages.pushToPage(const TouristPlaceDetailsScreen(), context);
              },),
            ),
          ],
        ),
      )
    );
  }
}
