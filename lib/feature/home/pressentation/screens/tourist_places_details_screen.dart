import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/global/toast_states/enums.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/home/data/models/tourist_places_response.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_slider_widget.dart';

class TouristPlaceDetailsScreen extends StatefulWidget {
  const TouristPlaceDetailsScreen({super.key, this.touristPlaceResponse});
  final TouristPlaceResponse? touristPlaceResponse;
  @override
  State<TouristPlaceDetailsScreen> createState() => _TouristPlaceDetailsScreenState();
}

class _TouristPlaceDetailsScreenState extends State<TouristPlaceDetailsScreen> {
  int currentIndex = 0;
  int currentIndex2 = 0;
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CustomSliderWidget(image:widget.touristPlaceResponse!.images!.map((e) => e.image!).toList()),
                Positioned(
                    top: 40.h,
                    left: 10.w,
                    right: 10.w,
                    child:
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                    const Spacer(),
                    IconButton(onPressed: (){
                      if(HomeCubit.get(context).token!=null){
                        setState(() {
                          isFav=!isFav;
                        });
                      }else{
                        showToast('Log_in_first'.tr(), ToastStates.error, context);
                      }

                    }, icon:  Icon(
                      isFav==false?
                      Icons.favorite_border_rounded:Icons.favorite,color:isFav==false? Colors.white:Colors.red,))
                  ],
                )),
                Positioned(
                    bottom: 50.h,
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
                            '${widget.touristPlaceResponse!.packageTourCount} ${'tour_packages'.tr()}',
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
            Padding(
              padding:  EdgeInsets.only(left: 16.w,right: 16.w,bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.touristPlaceResponse!.region!,
                    style: TextStyles.font17CustomBlack700WeightPoppins,
                    textScaleFactor: ScaleSize.textScaleFactor(context),

                  ),
                  verticalSpace(8),
                  Text(widget.touristPlaceResponse!.information!,
                    style: TextStyles.font17CustomGray400WightLato,
                    textScaleFactor: ScaleSize.textScaleFactor(context),
                  ),
                  verticalSpace(10),
                  Text(widget.touristPlaceResponse!.historicalFacts!,
                    style: TextStyles.font17CustomGray400WightLato,
                    textScaleFactor: ScaleSize.textScaleFactor(context),
                  ),
                  verticalSpace(32),
                  Text('related_programs'.tr(),
                    style: TextStyles.font17CustomBlack700WeightPoppins,
                    textScaleFactor: ScaleSize.textScaleFactor(context),
                  ),
                  verticalSpace(16),
                  SizedBox(
                    height: 122.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context,index){
                          return Padding(
                            padding:  EdgeInsets.only(right: 8.w),
                            child: Column(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width: 170.w,
                                    height: 90.h,
                                    child: ClipRRect(
                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                        child: Image.asset(AppImages.test,fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(
                                    height: 24.h,
                                    child: Text('Religious',
                                      textScaleFactor: ScaleSize.textScaleFactor(context),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyles.font17Black400WightLato.copyWith(color: AppColorLight.customBlack),
                                    )),
                              ],
                            ),
                          );
                        }),
                  ),

                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}
