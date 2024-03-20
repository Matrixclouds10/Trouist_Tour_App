import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/feature/home/pressentation/screens/tourist_places_details_screen.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_loading_widget.dart';

class CustomTouristPlaces extends StatelessWidget {
  const CustomTouristPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit =HomeCubit.get(context);
    return   GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 10,
      childAspectRatio: 1 / 0.75,
      children: List.generate( 4, (index) {
        return InkWell(
          onTap: (){
            NavigatePages.pushToPage( TouristPlaceDetailsScreen(touristPlaceResponse: cubit.touristPlacesResponseModel![index],), context);
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
                      child: Image.network(
                        cubit.touristPlacesResponseModel![index].images![0].image!,
                        errorBuilder: (context,error,v){
                          return const CustomLoadingWidget();
                        },
                        fit: BoxFit.cover,width: 168.w,),
                    ),
                  ),
                ),
                verticalSpace(8),
                 Text( cubit.touristPlacesResponseModel![index].region!,
                  // textScaleFactor: ScaleSize.textScaleFactor(context),
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
