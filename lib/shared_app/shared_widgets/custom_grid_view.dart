import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/tourist_places_response.dart';
import 'package:tourist_tour_app/feature/home/pressentation/screens/tourist_places_details_screen.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/screens/program_details.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_loading_widget.dart';

class CustomGridViewWidget extends StatelessWidget {
  const CustomGridViewWidget({super.key,required this.titles, required this.images,
    required this.imageHeight, required this.crossAxisCount, required this.childAspectRatio,
    this.crossAxisSpacing, this.mainAxisSpacing, this.isPlaces, this.programResponse, this.onTap, this.touristPlaces, });
    final double childAspectRatio;
    final int imageHeight;
    final double? crossAxisSpacing;
    final bool? isPlaces;
    final List<ProgramResponse>? programResponse;
    final List<TouristPlaceResponse>? touristPlaces;
    final double? mainAxisSpacing;
    final void Function()? onTap;
    final int crossAxisCount;
   final List<String> titles;
   final List<String> images;
  @override
  Widget build(BuildContext context) {
    return  GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      crossAxisSpacing:crossAxisSpacing?? 0,
      mainAxisSpacing:mainAxisSpacing?? 0,
      childAspectRatio: (1 / childAspectRatio).h,
      children: List.generate(titles.length, (index) {
        return InkWell(
          onTap:onTap?? (){
            if(touristPlaces!=null){
              NavigatePages.pushToPage( TouristPlaceDetailsScreen(touristPlaceResponse:touristPlaces![index],), context);
            }
            if(programResponse!=null){
              NavigatePages.pushToPage( ProgramDetailsScreen(
                programResponse: programResponse![index],
              ), context);
            }
          },
          child: SizedBox(
            width: 168.w,
            child: Column(
              children: [
                isPlaces==true?Expanded(
                  child: Stack(
                    children: [
                      SizedBox(
                        height:imageHeight.h,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          child: Image.network(
                            images[index],fit: BoxFit.cover,width: 168.w,
                           errorBuilder: (context,error,v){
                              return const CustomLoadingWidget();
                           },
                          ),
                        ),
                      ),
                      Positioned(
                          top: imageHeight.h/1.59,
                          left: 0,
                          child:Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8))
                            ),
                            width: 150.w,
                            height: 30.h,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 0.0,),
                                child: Text(
                                  '${touristPlaces![index].packageTourCount} ${'tour_packages'.tr()}',
                                  textScaleFactor: ScaleSize.textScaleFactor(context),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.font12CustomRed500WeightLato.copyWith(
                                      fontFamily: AppFontsFamily.fontPoppins,
                                      fontWeight: FontWeight.w600,
                                      color: AppColorLight.primaryColor),
                                ),
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                ):
                Expanded(
                  child: SizedBox(
                    height:imageHeight.h,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.network(images[index],fit: BoxFit.cover,width: 168.w,
                        errorBuilder: (context,error,v){
                          return const CustomLoadingWidget();
                        },),
                    ),
                  ),
                ),
                verticalSpace(8),
                 Text(titles[index],
                   style: TextStyles.font17Black400WightLato,
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
