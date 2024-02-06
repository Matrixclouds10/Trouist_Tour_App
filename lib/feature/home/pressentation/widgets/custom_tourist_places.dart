import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/tourist_places/presentation/screens/tourist_places_details_screen.dart';

class CustomTouristPlaces extends StatelessWidget {
  const CustomTouristPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return   GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 10,
      childAspectRatio: 1 / 0.75,
      children: List.generate(10, (index) {
        return InkWell(
          onTap: (){
            NavigatePages.pushToPage(const TouristPlaceDetailsScreen(), context);
          },
          child: SizedBox(
            width: 168.w,
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    height:100.h,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(AppImages.testImage,fit: BoxFit.cover,width: 168.w,),
                    ),
                  ),
                ),
                verticalSpace(8),
                Text('Rijal Almaa Village',
                  textScaleFactor: ScaleSize.textScaleFactor(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
